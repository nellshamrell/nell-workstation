#
# Cookbook Name:: nell-workstation
# Recipe:: terraform
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'add docker gpg' do
  command 'sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
end

execute 'add docker to apt sources' do
  command "sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'"
end

execute 'update with package db' do
  command 'sudo apt-get update'
end

execute 'install docker' do
  command 'sudo apt-get install -y docker-engine'
end
