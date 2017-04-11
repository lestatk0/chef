#install Tomcat
yum_package 'tomcat' do
  action :install
end

#Install Tomcat
service 'tomcat' do
  supports :status => true, :restart => true, :stop => true, :start => true
  action   [ :enable, :start] 
end

#Install unzip
yum_package 'unzip' do
  action :install
end

#Download app
remote_file node[:tomcat][:path_app] do
  source node[:tomcat][:url_app]
  action :create_if_missing
end

#Unpack app
bash "unpack application" do
 code <<-EOF
    unzip -j #{node[:tomcat][:path_app]} -d /usr/share/tomcat/webapps  
  EOF
  not_if {File.directory?("#{node[:tomcat][:deploy_path]}/testweb")}
  notifies :restart, 'service[tomcat]', :immediately
end
