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

