
sudo apt-get update
sudo apt-get install -y guile-1.8 libglib2.0-dev libgtk2.0-dev libgmp-dev

cd /vagrant
if [ ! -f balsa-4.0.tar.gz ]; then
wget http://apt.cs.manchester.ac.uk/ftp/pub/apt/balsa/4.0/balsa-4.0.tar.gz
wget http://apt.cs.manchester.ac.uk/ftp/pub/apt/balsa/4.0/balsa-sim-verilog-4.0.tar.gz
wget http://apt.cs.manchester.ac.uk/ftp/pub/apt/balsa/4.0/balsa-tech-example-4.0.tar.gz
wget http://apt.cs.manchester.ac.uk/ftp/pub/apt/balsa/4.0/balsa-tech-minimal-4.0.tar.gz
fi

cd
if [ -f balsa-4.0 ]; then
tar xzf /vagrant/balsa-4.0.tar.gz
tar xzf /vagrant/balsa-sim-verilog-4.0.tar.gz
tar xzf /vagrant/balsa-tech-example-4.0.tar.gz
tar xzf /vagrant/balsa-tech-minimal-4.0.tar.gz
fi

cd balsa-4.0
./configure
make
sudo make install
cd ..

cd balsa-sim-verilog-4.0
./configure
make
sudo make install
cd ..

cd balsa-tech-example-4.0
./configure
make
sudo make install
cd ..

cd balsa-tech-minimal-4.0
./configure
make
sudo make install
cd ..


