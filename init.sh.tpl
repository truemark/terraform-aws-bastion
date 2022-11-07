#!/usr/bin/env bash
# ${identifier}

export DEBIAN_FRONTEND=noninteractive

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

#------------------------------------------------------------------------------
# Add PostgreSQL Client
#------------------------------------------------------------------------------
curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
apt-get update -qq && apt-get install -qq postgresql-client-${postgres_version}

#------------------------------------------------------------------------------
# Add MySQL Client
#------------------------------------------------------------------------------
apt-get install -qq mysql-client-8.0
