#
# Cookbook Name:: nell-workstation
# Recipe:: habitat
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'download habitat' do
  command 'wget -O habitat.tar.gz https://api.bintray.com/content/habitat/stable/linux/x86_64/hab-%24latest-x86_64-linux.tar.gz?bt_package=hab-x86_64-linux && sudo tar -xzf habitat.tar.gz -C /bin --strip-components 1'
end

