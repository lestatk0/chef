web "install apache" do
  action :install
  provider "web_apache"
end

web "setup apache index.html" do
  action :setup
  provider "web_apache"
end

web "start apache" do
  action :start
  provider "web_apache"
end
