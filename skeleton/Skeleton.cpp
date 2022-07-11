#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/InstIterator.h"

#include <cstdint>
#include <unordered_map>
#include <map>
#include <string>

using namespace llvm;

namespace {
  struct SkeletonPass : public FunctionPass {

    static char ID;
    SkeletonPass() : FunctionPass(ID) {}

    std::unordered_map<std::string, std::map<uint32_t, std::uintmax_t>> structs;

    virtual bool runOnFunction(Function& F) {

      for (BasicBlock& B : F) {
        for(Instruction& I : B) {

          // if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(&I)) {
          //   checkForStructMemberAccess(G);
          // }

          // if(LoadInst* L = dyn_cast<LoadInst>(&I)) {
          //   if(ConstantExpr* C = dyn_cast<ConstantExpr>(L->getPointerOperand())) {
          //     if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(C->getAsInstruction())) {
          //       checkForStructMemberAccess(G);
          //     }
          //   }
          // }

          // if(StoreInst* S = dyn_cast<StoreInst>(&I)) {
          //   if(ConstantExpr* C = dyn_cast<ConstantExpr>(S->getPointerOperand())) {
          //     if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(C->getAsInstruction())) {
          //       checkForStructMemberAccess(G);
          //     }
          //   }
          // }

          check_instructions(I);

          if(CallInst *CI = dyn_cast<CallInst>(&I)){
            if(Function *Callee = CI->getCalledFunction()){
              for (inst_iterator _I = inst_begin(Callee), E = inst_end(Callee); _I != E; ++_I){
                check_instructions(*_I);
              }
            }
          }

        }
      }

      return false;
    }

    virtual bool doFinalization(Module& M) {
      errs() << "Member access heatmap:\n";
      printMemberAccessHeatmap();

      return false;
    }

private:

    void check_instructions(Instruction& I){
      if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(&I)) {
        checkForStructMemberAccess(G);
      }

      if(LoadInst* L = dyn_cast<LoadInst>(&I)) {
        if(ConstantExpr* C = dyn_cast<ConstantExpr>(L->getPointerOperand())) {
          if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(C->getAsInstruction())) {
            checkForStructMemberAccess(G);
          }
        }
      }

      if(StoreInst* S = dyn_cast<StoreInst>(&I)) {
        if(ConstantExpr* C = dyn_cast<ConstantExpr>(S->getPointerOperand())) {
          if(GetElementPtrInst* G = dyn_cast<GetElementPtrInst>(C->getAsInstruction())) {
            checkForStructMemberAccess(G);
          }
        }
      }
    }

    void printMemberAccessHeatmap() {
      for(const auto& [sname, mems] : structs) {
        errs() << sname << ":\n";
        for(const auto& [mem, count] : mems) {
          errs() << mem << ": " << count << "\n";
        }
      }
    }

    void checkForStructMemberAccess(GetElementPtrInst* G) {
      Type* T = G->getSourceElementType();
      bool skipped = false;
      for(Value* V : G->indices()) {

        if(!skipped) {
          skipped = true;
          continue;
        }

        uint64_t idx = cast<ConstantInt>(V)->getZExtValue();
        if(StructType* S = dyn_cast<StructType>(T)) {
          if(S->hasName()) {
            std::string sname = S->getName().str();
            structs[sname][idx]++;
          }
        }

        if(T->isPointerTy() || T->isArrayTy() || T->isVectorTy())
          T = T->getContainedType(0);
        else
          T = T->getContainedType(idx);

      }
    }

  };
}

char SkeletonPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerSkeletonPass(const PassManagerBuilder&, legacy::PassManagerBase& PM) {
  PM.add(new SkeletonPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerSkeletonPass);
