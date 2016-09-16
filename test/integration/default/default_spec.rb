# Verify Vim functionality

describe package('vim') do
  it { should be_installed }
end

describe file('.vimrc') do
  it { should be_file }
  its('content') { should match /filetype off/ }
end

describe package('tmux') do
  it { should be_installed }
end

describe file('.tmux.conf') do
  it { should be_file }
  its('content') { should match /act like vim/ }
end

describe file('.bash_profile') do
  it { should be_file }
  its('content') { should match /Load in the git branch prompt/ }
end

describe file('.bashrc') do
  it { should be_file }
  its('content') { should match /alias redis/ }
end

describe package('git') do
  it { should be_installed }
end

describe file('.git-completion.bash') do
  it { should be_file }
end

describe file('.git-prompt.sh') do
  it { should be_file }
end

describe file('.gitconfig') do
  it { should be_file }
  its('content') { should match /\[alias\]/ }
end

describe package('unzip') do
  it { should be_installed }
end

describe command('chef -v') do
  its('stdout') { should match(/Chef Development Kit/) }
end
