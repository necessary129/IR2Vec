yum install -y wget bash cmake
mkdir build && cd build
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/llvm-12.0.0.src.tar.xz
tar -xvf https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/llvm-12.0.0.src.tar.xz
cd llvm-12.0.0
mkdir build
cd build
cmake ..
make -j$(nproc)
make install

wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar -xvzf eigen-3.3.7.tar.gz

mkdir eigen-build
cd eigen-build
cmake ../eigen-3.3.7
make -j$(nproc) && make install

cd /project/build
cmake ../src && make -j$(nproc) && make install