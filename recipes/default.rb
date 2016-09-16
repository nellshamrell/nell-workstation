#
# Cookbook Name:: nell-workstation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "run apt-get update" do
  command "apt-get update"
end

package 'vim'

user = node['user']
home = Dir.home(user)

template "#{home}/.vimrc" do
  source 'vimrc.erb'
end

package 'tmux'

template "#{home}/.tmux.conf" do
  source 'tmux.erb'
end

template "#{home}/.bash_profile" do
  source 'bash_profile.erb'
end

template "#{home}/.bashrc" do
  source 'bashrc.erb'
end

package 'git'

template "#{home}/.git-completion.bash" do
  source 'git-completion.erb'
end

template "#{home}/.git-prompt.sh" do
  source 'git-prompt.erb'
end

template "#{home}/.gitconfig" do
  source 'gitconfig.erb'
end

package 'unzip'

execute 'download chefdk' do
  command 'wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.17.17-1_amd64.deb'
end

execute 'install chefdk' do
  command 'dpkg -i chefdk_0.17.17-1_amd64.deb'
end

include_recipe 'nell-workstation::terraform'
