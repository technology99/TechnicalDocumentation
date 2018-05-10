#
## Cookbook Name:: nginx
## Attributes:: default
#
#Author:: Cloud Group
#Copyright 2018, Challenge code
#

Chef::Log.info('Running nginx::default...')

case node['platform_family']
  when 'rhel','centos'
    default['nginx']['log_path'] = "/var/log/nginx"
    default['nginx']['log']  = "#{node['nginx']['log_path']}/teradata_logs"
    default['nginx']['log2'] = "#{node['nginx']['log_path']}/new_log_dir1" 
    default['nginx']['log3'] = "#{node['nginx']['log_path']}/new_log_dir2"
    default['nginx']['dst_path'] = "/usr/share/nginx/html"
    default['nginx']['src_file'] = "index.html"
    default['nginx']['local_file_path'] = "#{node['nginx']['dst_path']}/#{node['nginx']['src_file']}"
  else
    Chef::Application.fatal!("This platform is not supported: #{node['platform_family']}", 1)
end
