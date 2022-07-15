
# use tags to checkout the version we want 
cd opencv
git fetch --all --tags
git checkout tags/4.6.0 -b v4.6.0-build-branch
cd ..

# back inside project root we make all the build dirs
prefix=build_4_6_0_
release_dir=${prefix}_release
debug_dir=${prefix}_debug

# overwrite if they already exist with -p
mkdir -p ${release_dir}
mkdir -p ${debug_dir}

# release build
cd ${release_dir}
cmake -D CMAKE_BUILD_TYPE=RELEASE -DBUILD_EXAMPLES=ON -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON ../opencv
make
cd ..

# debug build
cd ${debug_dir}
cmake -D CMAKE_BUILD_TYPE=DEBUG -DBUILD_EXAMPLES=ON -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON ../opencv
make
cd ..



# TBD ...

