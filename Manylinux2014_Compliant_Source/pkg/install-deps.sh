wget https://apt.llvm.org/llvm.sh
sudo bash llvm.sh 12

mkdir build && cd build
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar -xvzf eigen-3.3.7.tar.gz

mkdir eigen-build
cd eigen-build
cmake ../eigen-3.3.7
make -j$(nproc) && cd ..