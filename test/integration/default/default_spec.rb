# Verify Vim functionality

describe package('vim') do
  it { should be_installed }
end

describe file('.vimrc') do
  it { should be_file }
  its('content') { should match /filetype off/ }
end


