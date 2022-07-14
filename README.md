## Setup ##

LLVM is an umbrella project for building compilers
and code transformation tools. It consists of several sub-projects like Clang,
LLD and, confusingly enough, the LLVM sub-project. We consider in this project:
- Building the LLVM *sub-project* from source
- Building a out-of-source LLVM pass to generate frequencies of structure members accessed.

We will be building LLVM v`10.0.0` which is the latest as of this writing.
We assume that you have a working compiler toolchain (GCC or LLVM) and that CMake is installed (minimum version 3.4).


## Building the HeatMap LLVM pass ##

To build the heatmap LLVM pass found in `heatmap` folder:
```bash
$ cd Structure_HeatMap 
$ mkdir build
$ cd build
$ cmake ..
$ make
```
`cmake` needs to find its LLVM configurations in `[LLVM_DIR]`. We automatically
setup `[LLVM_DIR]` based on `$LLVM_HOME` for you. Now the easiest way to run the skeleton pass is to use Clang:
```bash
$ clang -flegacy-pass-manager -Xclang -load -Xclang build/skeleton/libHeatmapPass.* something.c$
```
Note that Clang is the compiler front-end of the LLVM project.
It can be installed separately in binary form.

### Further resources
This tutorial is based on the following resources

- Adrian Sampson's blog entry "LLVM for Grad Students" ([link](http://adriansampson.net/blog/llvm.html))
- LLVM documentation: Writing an LLVM pass ([link](http://llvm.org/docs/WritingAnLLVMPass.html))
- LLVM documentation: Building LLVM with CMake ([link](http://llvm.org/docs/CMake.html#cmake-out-of-source-pass))
