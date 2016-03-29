#
# Cookbook Name:: nell-workstation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "run apt-get update for supermarket updates" do
  command "apt-get update"
end

package 'vim'

template '.vimrc' do
  source 'vimrc.erb'
end

package 'tmux'

template '.tmux.conf' do
  source 'tmux.erb'
end

template '.bash_profile' do
  source 'bash_profile.erb'
end

template '.bashrc' do
  source 'bashrc.erb'
end

package 'git'

template '.git-completion.bash' do
  source 'git-completion.erb'
end

template '.git-prompt.sh' do
  source 'git-prompt.erb'
end

template '.gitconfig' do
  source 'gitconfig.erb'
end

package 'unzip'

execute 'chefdk' do
  command 'wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.12.0-1_amd64.deb'
end

include_recipe 'nell-workstation::terraform'
