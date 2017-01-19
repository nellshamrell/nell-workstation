#
# Cookbook Name:: nell-workstation
# Recipe:: terraform
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'download terraform' do
  command 'wget https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip'
end

execute 'install terraform' do
  command 'unzip -o terraform_0.8.4_linux_amd64.zip -d /bin'
end
