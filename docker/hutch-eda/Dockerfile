# Use ubuntu base dockerfile
FROM ubuntu:xenial

WORKDIR /vagrant/hutch-eda

ADD . /workspace

# Install needed packages
RUN bash /workspace/provision.sh

CMD ["yosys"]

