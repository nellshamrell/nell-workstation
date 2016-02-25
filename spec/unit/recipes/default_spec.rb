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
  end
end
