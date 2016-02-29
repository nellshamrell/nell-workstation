#
# Cookbook Name:: nell-workstation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

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
  command 'curl -L https://www.getchef.com/chef/install.sh | sudo bash -s -- -P chefdk'
end

include_recipe 'nell-workstation::terraform'
