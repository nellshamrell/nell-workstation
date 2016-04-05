#
# Cookbook Name:: nell-workstation
# Recipe:: terraform
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'download terraform' do
  command 'wget https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip'
end

execute 'install terraform' do
  command 'unzip terraform_0.6.14_linux_amd64.zip -d /bin'
end
