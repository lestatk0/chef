package 'unzip' do
  action :install
end

# download jboss archive
remote_file node[:jboss][:tmp_app] do
  source node[:jboss][:sample_app]
  owner node[:jboss][:jboss_user]
  group node[:jboss][:jboss_group]
  action :create_if_missing
end

# unpack application
bash "unpack application" do
  code <<-EOF
    unzip #{node[:jboss][:tmp_app]} -d #{node[:jboss][:jboss_home]}/standalone/deployments/
    chown -R #{node[:jboss][:jboss_user]}:#{node[:jboss][:jboss_group]} #{node[:jboss][:jboss_home]}/standalone/deployments/testweb/
  EOF
  not_if { ::File.directory? ("#{node[:jboss][:jboss_home]}/standalone/deployments/testweb/") }
  notifies :restart, 'service[jboss]', :immediately
end
