#!/bin/bash

az=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
iid=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

region=${az::-1}
#echo $region
#echo $iid

aws ec2 create-tags --region=$region --resources=$iid --tags Key=Name,Value="ECS - $iid"
