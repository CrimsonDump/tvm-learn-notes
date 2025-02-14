#!/usr/bin/env fish

test -d build || mkdir build
pushd build
  cp ../cmake/config.cmake .
  # controls default compilation flags (Candidates: Release, Debug, RelWithDebInfo)
  echo "set(CMAKE_BUILD_TYPE Debug)" >> config.cmake

  # LLVM is a must dependency for compiler end
  echo "set(USE_LLVM \"llvm-config --ignore-libllvm --link-static\")" >> config.cmake
  echo "set(HIDE_PRIVATE_SYMBOLS ON)" >> config.cmake

  # GPU SDKs, turn on if needed
  echo "set(CMAKE_CUDA_ARCHITECTURES 80)" >> config.cmake
  echo "set(USE_CUDA   ON)" >> config.cmake
  echo "set(USE_METAL  OFF)" >> config.cmake
  echo "set(USE_VULKAN OFF)" >> config.cmake
  echo "set(USE_OPENCL OFF)" >> config.cmake

  # cuBLAS, cuDNN, cutlass support, turn on if needed
  echo "set(USE_CUBLAS ON)" >> config.cmake
  echo "set(USE_CUDNN  OFF)" >> config.cmake
  echo "set(USE_CUTLASS ON)" >> config.cmake

  set -a opts -GNinja

  cmake $opts .. && cmake --build . 
popd