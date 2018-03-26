apt-get update
apt-get install -y build-essential clang bison flex \
        libreadline-dev gawk tcl-dev libffi-dev git mercurial \
        graphviz xdot pkg-config python3

git clone https://github.com/YosysHQ/yosys.git
cd yosys
make config-clang
make
make install
cd ..
rm -rf yosys

# Clean up build packages
apt-get remove -y build-essential clang bison flex git mercurial
apt-get purge
apt-get autoremove
apt-get autoclean

