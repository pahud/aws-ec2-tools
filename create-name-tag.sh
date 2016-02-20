#!/bin/bash

echo ECS_CLUSTER=default >> /etc/ecs/ecs.config

sudo yum install -y aws-cli
az=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
iid=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

region=${az::-1}

aws ec2 create-tags --region=$region --resources=$iid --tags Key=Name,Value="ECS - $iid"
