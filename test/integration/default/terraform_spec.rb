describe command('terraform -v') do
  its('stdout') { should match(/Terraform/) }
end
