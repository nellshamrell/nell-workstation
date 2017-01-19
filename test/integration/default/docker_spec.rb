describe command('sudo systemctl status docker') do
  its('stdout') { should match(/Docker Application Container Engine/) }
end
