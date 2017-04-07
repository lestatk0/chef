service "jboss" do
  supports :status => true, :restart => true, :reload => true
  action   :restart
end