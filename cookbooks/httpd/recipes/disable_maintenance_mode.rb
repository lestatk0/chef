 
execute 'delete_maintenance.conf' do
 command "rm -rf #{node[:httpd][:httpd_path]}/maintenance.conf"
end


template "#{node[:httpd][:httpd_path]}/app.conf" do
  source "app.conf.erb"
  action :create
end


service 'httpd' do
  supports :status => true, :restart => true, :stop => true, :start => true
  action   [ :enable, :restart] 
end