yum install -y wget bash cmake ncurses-libs ncurses-devel

mkdir build && cd build
wget -q https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz >/dev/null
tar -xf clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
cp -r clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04/* /usr/local/

wget -q https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz 
tar -xzf eigen-3.3.7.tar.gz

mkdir eigen-build
cd eigen-build
cmake ../eigen-3.3.7
make -j$(nproc) && make install

mkdir /project/finalbuild && cd /project/finalbuild
mkdir -p /usr/lib/x86_64-linux-gnu
ls /usr/lib/libtin*
ln -s /usr/lib/libtinfo.so.* /usr/lib/x86_64-linux-gnu/libtinfo.so
cmake /project/src && make -j$(nproc) && make install