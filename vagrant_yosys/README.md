This directory contains a Vagrant box to build the "openeda" box hosted on
Vagrant cloud.  

The build script automatically downloads and builds the latest versions of Icarus 
Verilog and Yosys, along with several of the provers for Yosys formal.

To build, first run "vagrant up" and allow the box to finish the build process,
then run "vagrant package", which will shut the box down and build a .box file
for upload to the cloud.

Log in to Vagrant Cloud, create a new version with the virtualbox provider, and upload
the resulting .box file.

The balsa.sh file is for testing the addition of the Balsa synthesis system to the box.
