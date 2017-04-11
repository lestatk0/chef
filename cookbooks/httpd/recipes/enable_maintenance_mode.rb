template "#{node[:httpd][:maintenance_file]}" do
  source "maintenance.html.erb"
  action :create
end

template "#{node[:httpd][:httpd_path]}/maintenance.conf" do
  source "maintenance.conf.erb"
  action :create
  variables({
    :maintenance_file => node[:httpd][:maintenance_file]        
  })
end

execute 'delete_app.conf' do
 command "rm -rf #{node[:httpd][:httpd_path]}/app.conf"
end

service 'httpd' do
  supports :status => true, :restart => true, :stop => true, :start => true
  action   [ :enable, :restart] 
end