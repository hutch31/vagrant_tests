apt-get update
apt-get -y install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git mercurial \
	graphviz xdot pkg-config python3 
# Dependencies for Icarus Verilog
apt-get -y install autoconf gtkwave gperf

BASE=$HOME
cd $BASE

# Clone and install Yosys
git clone https://github.com/YosysHQ/yosys.git
cd yosys
make config-clang
make
make install
make clean  # remove files post build
cd $BASE

# Clone and Install Icarus Verilog
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
autoconf
./configure
make
make install
make clean  # remove files post build
cd $BASE

# Additional packages for SymbiYosys
apt-get install -y libftdi-dev gperf \
                     libboost-program-options-dev autoconf libgmp-dev \
                     cmake

# Clone and install SymbiYosys
git clone https://github.com/cliffordwolf/SymbiYosys.git SymbiYosys
cd SymbiYosys
make install
cd $BASE

# Build Yices2 solver
git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
make install
cd $BASE

# Build Z3 solver
git clone https://github.com/Z3Prover/z3.git z3
cd z3
python scripts/mk_make.py
cd build
make -j$(nproc)
make install
cd $BASE


# Build Avy solver
git clone https://bitbucket.org/arieg/extavy.git
cd extavy
git submodule update --init
mkdir build; cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
cp avy/src/{avy,avybmc} /usr/local/bin/
cd $BASE

# Build boolector solver
wget http://fmv.jku.at/boolector/boolector-2.4.1-with-lingeling-bbc.tar.bz2
tar xvjf boolector-2.4.1-with-lingeling-bbc.tar.bz2
cd boolector-2.4.1-with-lingeling-bbc/
make
cp boolector/bin/boolector /usr/local/bin/boolector
cd $BASE

# Change owner back to default (vagrant)
rm -rf vagrant yosys iverilog extavy boolector-2.4.1-with-lingeling-bbc SymbiYosys z3 yices2

