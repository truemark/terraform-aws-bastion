#!/usr/bin/env bash
# ${identifier}

#------------------------------------------------------------------------------
# SSH Authorized Keys Configuration
#------------------------------------------------------------------------------
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
touch /home/ubuntu/.ssh/authorized_keys
chmod 600 /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
%{ for k in ssh_keys ~}
echo "${k}" >> /home/ubuntu/.ssh/authorized_keys
%{ endfor ~}
