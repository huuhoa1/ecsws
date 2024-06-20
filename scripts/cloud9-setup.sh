#!/bin/bash

wget https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.43.0/ytt-linux-amd64 -O /usr/local/bin/ytt && chmod +x /usr/local/bin/ytt && ytt version

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq && yq version

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip &&  sudo ./aws/install && aws --version
