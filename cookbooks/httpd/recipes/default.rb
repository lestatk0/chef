 
yum_package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true, :restart => true, :stop => true, :start => true
  action   [ :enable, :start] 
end

template "#{node[:httpd][:httpd_path]}/app.conf" do
  source "app.conf.erb"
  action :create
  notifies :restart, 'service[httpd]', :delayed
end