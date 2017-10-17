#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export GIT_SSL_NO_VERIFY=true

ls
pwd

# echo '==> installing or updating docker-compose'
# su -c \
# "mkdir /opt/ && \
# mkdir /opt/bin && \
# curl -L -s https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose && \
# chmod +x /opt/bin/docker-compose"


# echo "==> authenticating on docker bravi registry"
mkdir /home/vagrant/.docker
echo -e "{\n    \"auths\": {\n        \"https://docker.bravi.com.br/v1/\": {\n            \"auth\": \"YWRtaW46MTIz\",\n            \"email\": \"$USER@bravi.com.br\"\n        },\n        \"https://docker-registry.bravi.com.br/v1/\": {\n            \"auth\": \"YnJhdmktZGV2ZWxvcGVyOnNsZS1tZVctaVQ=\",\n            \"email\": \"$USER@bravi.com.br\"\n        }\n    }\n}" > /home/vagrant/.docker/config.json
#
# echo "==> installing alias.sh"
# rm /home/vagrant/.bashrc
# echo 'source /home/core/.alias.sh' >> /home/vagrant/.bashrc

# echo "==> changing ip docker"
# sudo mkdir /etc/systemd/system/docker.service.d
# sudo mv /home/vagrant/docker.conf /etc/systemd/system/docker.service.d/docker.conf
# sudo systemctl daemon-reload
# sudo systemctl restart docker



#/
# // copy keys to vm
#
# // config docker ip with sudo
# http://stackoverflow.com/questions/22159044/how-to-append-a-string-at-end-of-a-specific-line-in-a-file-in-bash
