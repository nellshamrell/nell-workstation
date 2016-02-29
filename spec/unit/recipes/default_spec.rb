#
# Cookbook Name:: nell-workstation
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nell-workstation::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    describe 'installing vim' do
      it 'installs vim' do
        expect(chef_run).to install_package('vim')
      end

      it 'creates the vimrc' do
        expect(chef_run).to render_file('.vimrc').with_content('" Configuration file for vim')
      end
    end

    describe 'install tmux' do
      it 'installs tmux' do
        expect(chef_run).to install_package('tmux')
      end

      it 'creates the tmux config' do
        expect(chef_run).to render_file('.tmux.conf').with_content("# act like vim")
      end
    end

    describe 'bash files' do
      it 'creates the bash_profile' do
        expect(chef_run).to render_file('.bash_profile').with_content("[[ -s \"$HOME/.profile\" ]] && source \"$HOME/.profile\" # Load the default .profile")
      end

      it 'creates the bashrc' do
        expect(chef_run).to render_file('.bashrc').with_content("alias redis='sudo redis-server /usr/local/etc/redis.conf'")
      end
    end

    describe 'installing git' do
      it 'installs git' do
        expect(chef_run).to install_package('git')
      end

      it 'creates the git completion script' do
        expect(chef_run).to render_file('.git-completion.bash').with_content('# bash/zsh completion support for core Git.')
      end

      it 'creates the git prompt script' do
        expect(chef_run).to render_file('.git-prompt.sh').with_content('# bash/zsh git prompt support')
      end

      it 'creates the git config' do
        expect(chef_run).to render_file('.gitconfig').with_content('[alias]')
      end
    end

    describe 'installing unzip' do
      it 'installs unzip' do
        expect(chef_run).to install_package('unzip')
      end
    end

    describe 'installing chef-dk' do
      it 'installs chef dk' do
        expect(chef_run).to run_execute('curl -L https://www.getchef.com/chef/install.sh | sudo bash -s -- -P chefdk')
      end
    end
  end
end
