#
## Cookbook Name:: snmp
## Recipe:: default
#
#Author:: Cloud Group
#Copyright 2018, Challenge code
#
## All rights reserved - Do Not Redistribute
#

package 'snmpd' do
  case node[:platform]
   when 'redhat','centos'
     action :install
   else
    Chef::Applicaiton.fatal!("This platform is not supported: #{node['platform_family']}", 1) 
   end
end

service 'snmpd' do
   action [ :start, :enable ]
   not_if "rpm -qa | grep -qa 'snmp'"
end