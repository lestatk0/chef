# knife.rb
```sh
log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '/home/student/.chef/stevedanno.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef-server/testorg-validator.pem'
chef_server_url          'https://host/organizations/testorg/'
syntax_check_cache_path  '/home/student/.chef/syntax_check_cache'
```

# Chef-dev.json
```sh
 {
      2   "name": "test-env",
      3   "description": "",
      4   "cookbook_versions": {
      5 
      6   },
      7   "json_class": "Chef::Environment",
      8   "chef_type": "environment",
      9   "default_attributes": {
     10 
     11   },
     12   "override_attributes": {
     13     "jboss": {
     14       "sample_app": "http://www.cumulogic.com/download/Apps/hudson.zip"
     15     }
     16   }
     17 }
```
# Data bag hutson
```sh
{
  "name": "data_bag_item_hudson_engine",
  "json_class": "Chef::DataBagItem",
  "chef_type": "data_bag_item",
  "data_bag": "hudson",
  "raw_data": {
    "id": "engine",
    "engine": "jboss-as-7.1.1.Final"
  }
}
```

# Role 

```sh
1 {
      2   "name": "JBOSS",
      3   "description": "",
      4   "json_class": "Chef::Role",
      5   "default_attributes": {
      6 
      7   },
      8   "override_attributes": {
      9 
     10   },
     11   "chef_type": "role",
     12   "run_list": [
     13     "recipe[jboss::default]"
     14   ],
     15   "env_run_lists": {
     16 
     17   }
     18 }
```
# Result

```sh
[vagrant@node1 ~]$ curl -IL localhost:8080/hudson/
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
X-Hudson: 2.0.0
X-Hudson-CLI-Port: 43765
Expires: 0
X-Hudson-Theme: default
Content-Type: text/html;charset=UTF-8
Transfer-Encoding: chunked
Date: Mon, 10 Apr 2017 17:40:02 GMT
```
