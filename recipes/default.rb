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
