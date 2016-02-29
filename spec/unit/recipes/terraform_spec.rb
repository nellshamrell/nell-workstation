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

    describe 'installing terraform' do
      it 'downloads terraform' do
        expect(chef_run).to run_execute('wget https://releases.hashicorp.com/terraform/0.6.12/terraform_0.6.12_linux_amd64.zip')
      end

      it 'unzips the file' do
        expect(chef_run).to run_execute('unzip terraform_0.6.12_linux_amd64.zip -d /bin')
      end
    end
  end
end
