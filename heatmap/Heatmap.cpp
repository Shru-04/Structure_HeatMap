#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/InstIterator.h"

#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/Statistic.h"

#include <cstdint>
#include <unordered_map>
#include <map>
#include <string>

using namespace llvm;

namespace {
  struct HeatmapPass : public FunctionPass {

    static char ID;
    HeatmapPass() : FunctionPass(ID) {}

    std::unordered_map<std::string, std::map<uint32_t, std::uintmax_t>> structs;
    std::vector<std::string> xx;

    virtual bool runOnFunction(Function& F) {

      //Always start from entrypoint function 'main()'
      if (F.getName().str() == "main"){
        //Check for each block and instruction
        for (BasicBlock& B : F) {
          for(Instruction& I : B) {
            check_instructions(I);
            
            //Check whether structs are there in Functions Called
            if(CallInst *CI = dyn_cast<CallInst>(&I)){
              if(Function *Callee = CI->getCalledFunction()){
                for (inst_iterator _I = inst_begin(Callee), E = inst_end(Callee); _I != E; ++_I){
                  check_instructions(*_I);
                }
              }

              //Check whether struct is passed as an argument

              for (int i = 0; i < CI->getNumArgOperands(); i++){
                Value *v1 = CI->getArgOperand(i);
                Type *x = v1->getType();
                for (auto ii = v1->user_begin(); ii != v1->user_end(); ++ii){
                  if (Instruction *inst = dyn_cast<Instruction>(*ii))
                    check_instructions(*inst);
                }
              }

            }
          }
        }
      }

      return false;
    }

    //Print O/P
    virtual bool doFinalization(Module& M) {
      errs() << "Member access heatmap:\n";
      printMemberAccessHeatmap();
      return false;
    }

private:

    void check_instructions(Instruction& I){

      //Checks for all instructions containing struct variables

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
        // for (auto i:xx)
        //   errs() << i << "\n";
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

        // Checks for all struct variable scopes, local and global, and updates frequency table

        uint64_t idx = cast<ConstantInt>(V)->getZExtValue();
        if(StructType* S = dyn_cast<StructType>(T)) {
          if(S->hasName()) {
            std::string sname = S->getName().str();
            structs[sname][idx]++;
          }
        }
        if (GlobalValue* Glob = dyn_cast<GlobalValue>(V)){
          if(StructType* S = dyn_cast<StructType>(Glob->getType())) {
            if(S->hasName()) {
              std::string sname = S->getName().str();
              structs[sname][idx]++;
            }
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

char HeatmapPass::ID = 0;

// Automatically enable the pass.
static void registerHeatmapPass(const PassManagerBuilder&, legacy::PassManagerBase& PM) {
  PM.add(new HeatmapPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible, registerHeatmapPass);