
#  MIT license
#  Copyright (C) 2024 Intel Corporation
#  SPDX-License-Identifier: MIT

mkdir -p build
cd build
source /opt/intel/oneapi/setvars.sh

#for FP16
#cmake .. -DLLAMA_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DLLAMA_SYCL_F16=ON # faster for long-prompt inference

#for FP32
cmake .. -DLLAMA_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx

<<<<<<< HEAD
#build example/main only
#cmake --build . --config Release --target main

#build all binary
cmake --build . --config Release -v
=======
#build example/main
#cmake --build . --config Release --target main

#build example/llama-bench
#cmake --build . --config Release --target llama-bench

#build all binary
cmake --build . --config Release -j -v
>>>>>>> b2776
