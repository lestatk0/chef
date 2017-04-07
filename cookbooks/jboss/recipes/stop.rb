service "jboss" do
  supports :status => true, :restart => true, :stop => true
  action   :stop 
end