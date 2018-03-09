sudo apt-get update
sudo apt-get -y install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git mercurial \
	graphviz xdot pkg-config python3 
# Dependencies for Icarus Verilog
sudo apt-get -y install autoconf gtkwave gperf

# Clone and install Yosys
git clone https://github.com/YosysHQ/yosys.git
cd yosys
make config-clang
make
sudo make install
make clean  # remove files post build
cd ..

# Clone and Install Icarus Verilog
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
autoconf
./configure
make
sudo make install
make clean  # remove files post build
cd ..

# Change owner back to default (vagrant)
#chown -R vagrant yosys iverilog

# Install NFS utils and mount vagrant shared dir
sudo apt-get -y install nfs-common
sudo mkdir /mnt/vshared
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-9250d93b.efs.us-west-2.amazonaws.com:/ /mnt/vshared


