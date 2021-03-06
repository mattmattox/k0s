#!/usr/bin/env bash
set -e

chmod 700 /home/ubuntu/.ssh/id_rsa
token=$(ssh -i /home/ubuntu/.ssh/id_rsa -o StrictHostKeyChecking=no ubuntu@$1 sudo k0s token create --role worker)

sudo nohup k0s worker $token >/home/ubuntu/k0s-worker.log 2>&1 &
