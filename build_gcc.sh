mkdir -p /crossenv/src/
cp /app/env.sh /crossenv/
cd /crossenv/
. ./env.sh
cd ./src
wget ftp://sourceware.org/pub/binutils/snapshots/binutils-2.30.90.tar.xz
wget https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
tar -xvJf ./binutils-2.30.90.tar.xz
tar -xvJf ./gcc-8.2.0.tar.xz
cd ./gcc-8.2.0
./contrib/download_prerequisites
cd ../
mkdir build-binutils
cd build-binutils
../binutils-2.30.90/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j2
make install
cd ..
mkdir build-gcc
cd build-gcc
../gcc-8.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make -j2 all-gcc
make -j2 all-target-libgcc
make install-gcc
make install-target-libgcc
