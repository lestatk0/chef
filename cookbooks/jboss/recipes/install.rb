
#create group
group node[:jboss][:jboss_group] do
  action :create
end

# create user
user node[:jboss][:jboss_user] do
  group node[:jboss][:jboss_group]
  manage_home true
  home '/home/jboss'
  action :create 
end

# download jboss archive
remote_file node[:jboss][:tmp_file] do
  source node[:jboss][:download_url]
  owner node[:jboss][:jboss_user]
  group node[:jboss][:jboss_group]
  mode '0755'
  action :create_if_missing
end

# extract files
execute 'extract_jboss' do
  command "tar xzf #{node['jboss']['tmp_file']} -C /opt "
  not_if { ::File.exist?("#{node['jboss']['jboss_home']}") }
end

# create folder
execute 'create folder' do
  command "mkdir /etc/jboss-as/"
  not_if { ::File.directory? ("/etc/jboss-as/") }
end

# add jboss_conf template
template "/etc/jboss-as/jboss_as.conf" do
  source "jboss_as.conf.erb"
  mode '0644'
  owner 'root'
  group 'root'
  variables({
     :jboss_user => node[:jboss][:jboss_user],
  })
  not_if {File.exists?("/etc/jboss_as/jboss_as.conf")}
end

# add init script template
template "/etc/init.d/jboss" do
  source "jboss-initd.sh.erb"
  mode '0755'
  owner 'root'
  group 'root'
  variables({
     :jboss_home => node[:jboss][:jboss_home],
     :jboss_user => node[:jboss][:jboss_user]        
  })
  not_if {File.exists?("/etc/init.d/jboss")}
end

include_recipe 'jboss::start'
