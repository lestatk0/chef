service "jboss" do
  supports :status => true, :restart => true, :stop => true, :start => true
  action   :restart
end