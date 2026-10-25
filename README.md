*This project has been created as part of the 42 curriculum by ael-ghaz*

# INCEPTION

## DESCRIPTION

This project aims to learn how to build a system administration by using Docker.

### Keywords

- Docker, Nginx, MariaDB, Wordpress
- proxy, HTTP, FASTCGI, Entrypoints

## INSTRUCTIONS

### Docker Installation

Set up Docker's apt repository:
`
#### Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

#### Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
`

Install the latest version and run Docker:

`
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
`
---


## RESSOURCES
