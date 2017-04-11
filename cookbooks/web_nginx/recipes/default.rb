web "install nginx" do
  action :install
  provider "web_nginx"
end


web "setup nginx index.html" do
  action :setup
  provider "web_nginx"
end

web "start nginx" do
  action :start
  provider "web_nginx"
end
