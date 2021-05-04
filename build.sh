# Build Script MacOS 10.15 Catalina
# 05/03/2021
# Ashley Tharp - ashley.tharp@gmail.com

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# cleanup step
rm -rf ./*/CMakeCache.txt

# Regular Build - No Cuda Support
mkdir -p build_release && mkdir -p build_debug
cd build_release && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON ../opencv && make -j16
cd ..
cd build_debug && cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_EXAMPLES=ON ../opencv && make -j16
cd .. 

# With Cuda Support
mkdir -p build_release_cuda && mkdir -p build_debug_cuda

# turn on Cuda support
sed -i '' 's/\"Include NVidia Cuda Runtime support\" OFF/\"Include NVidia Cuda Runtime support\" ON/g' $PWD/opencv/CMakeLists.txt

cd build_release_cuda && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DWITH_CUDA=ON ../opencv && make -j16
cd ..
cd build_debug_cuda && cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_EXAMPLES=ON -DWITH_CUDA=ON ../opencv && make -j16
cd ..
# turn back off Cuda Support to return CMakeLists.txt to original state
sed -i '' 's/\"Include NVidia Cuda Runtime support\" ON/\"Include NVidia Cuda Runtime support\" OFF/g' $PWD/opencv/CMakeLists.txt


