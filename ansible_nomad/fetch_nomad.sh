# Update apt and get dependencies
# Download Nomad
NOMAD_VERSION=0.7.0

echo "Fetching Nomad..."
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip

echo "Fetching Consul..."
curl -sSL https://releases.hashicorp.com/consul/1.0.0/consul_1.0.0_linux_amd64.zip > consul.zip

