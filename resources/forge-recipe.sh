# Recipe Name: Install Docker and Docker Compose
# Run as user: root
# Recipe:
# Uninstall any unofficial Docker packages
apt autoremove docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc

# Add Docker's official GPG key:
apt update
apt install ca-certificates curl
install -m 0755 -d /usr/share/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /usr/share/keyrings/docker.asc
chmod a+r /usr/share/keyrings/docker.asc

# Add the repository to Apt sources:
cat << EOF > /etc/apt/sources.list.d/docker.sources
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Signed-By: /usr/share/keyrings/docker.asc
Architectures: $(dpkg --print-architecture)
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
EOF

# Install the Docker packages
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Ensure Docker is running
systemctl start docker

# Add the forge user to the docker group
usermod -aG docker forge
