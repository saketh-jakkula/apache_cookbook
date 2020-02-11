#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'httpd'

#cookbook_file '/etc/httpd/conf.d/host.conf' do
#  source 'test.conf'
#  action :create
#end


template '/etc/httpd/conf.d/host.conf' do
  source 'host.conf.erb'
  variables(
     host_name: 'test.example.com',
     source: 'test'
  )
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    data: "saying hi from #{node['hostname']}"
  )
end


service 'httpd' do
  action [ :enable, :start ]
end



