version=4.0.0

# use tags to checkout the version we want 
cd opencv
git fetch --all --tags
git checkout tags/${version} -b v${version}-build-branch
cd ..

builds=(RELEASE DEBUG)

for i in "${!builds[@]}"; do
    echo "${builds[$i]} build"
    mkdir -p build_${version}_${builds[$i]}
    mkdir -p install_${version}_${builds[$i]}
    cd build_${version}_${builds[$i]}
    cmake -DCMAKE_BUILD_TYPE=${builds[$i]} -DBUILD_EXAMPLES=ON -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON -DCMAKE_INSTALL_PREFIX=../install_${version}_${builds[$i]} -DBUILD_opencv_world=ON ../opencv
    make -j16 # build with 16 cores. Remove j flag if your hardware can't support
    make install
    cd ..
done

