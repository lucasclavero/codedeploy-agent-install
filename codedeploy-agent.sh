#!/bin/bash

# AWS CLI
apt-get install zip -y;
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip";
unzip awscli-bundle.zip;
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws;
aws configure;

#AWS Access Key ID [None]: Obtained when creating user in AWS IAM
#AWS Secret Access Key [None]: Obtained when creating user in AWS IAM
#Default region name [None]: Your region, e.g. eu-central-1
#Default output format [None]:

#########
# 14.04 # http://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-run-agent-install.html
#########

# Python dependency
sudo apt-get update;
sudo apt-get install python-pip;

# Ruby dependency
sudo apt-get install ruby2.0;

# CodeDeploy Agent
cd /home/ubuntu;
wget https://aws-codedeploy-eu-central-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
sudo ./install auto;

sudo service codedeploy-agent start
sudo service codedeploy-agent status

#########
# 16.04 # https://github.com/aws/aws-codedeploy-agent/issues/61
#########

# Python dependency
sudo apt-get update;
sudo apt-get install python-pip;

# Ruby dependency
sudo mkdir -p /etc/apt/sources.list.d
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6
cat <<EOF | sudo tee /etc/apt/sources.list.d/brightbox-ubuntu-ruby-ng-wily.list
deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu wily main
EOF
sudo apt-get update
sudo apt-get install ruby2.0

# CodeDeploy Agent
cd /home/ubuntu;
wget https://aws-codedeploy-eu-central-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
sudo ./install auto;

sudo systemctl start codedeploy-agent 
sudo systemctl status codedeploy-agent 

#########
# 18.04 # https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html
#########

# Switch to root and update first
sudo su
apt update

# Ruby dependency
apt install ruby

# CodeDeploy Agent
cd /home/ubuntu;
wget https://aws-codedeploy-eu-central-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
./install auto;

# Enable and check status of the agent
systemctl start codedeploy-agent
systemctl status codedeploy-agent
