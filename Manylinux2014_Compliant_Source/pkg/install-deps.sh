yum install -y wget bash cmake

mkdir build && cd build
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar -xvf https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
mv clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04/* /usr/

wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar -xvzf eigen-3.3.7.tar.gz

mkdir eigen-build
cd eigen-build
cmake ../eigen-3.3.7
make -j$(nproc) && make install

cd ..
cmake ../src && make -j$(nproc) && make install