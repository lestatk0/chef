if node.role?("#{node['web_server_type']['nginx']}")
   include_recipe 'web_nginx'

elsif node.role?("#{node['web_server_type']['apache']}")
   include_recipe 'web_apache'
end
