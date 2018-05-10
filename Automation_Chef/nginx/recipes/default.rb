#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2018, Challenge code
#
# All rights reserved - Do Not Redistribute
#
## 1. Install an nginx web server
#
package 'nginx' do
  case node[:platform]
   when 'redhat','centos'
     action :install
     not_if { ::Dir.exist?(node['nginx']['log_path']) }
   else
    Chef::Applicaiton.fatal!("This platform is not supported: #{node['platform_family']}", 1) 
   end
end
#
## 2. Create 3 directories: teradata_logs, new_log_dir1, and new_log_dir2.
#
[ node['nginx']['log'],
  node['nginx']['log2'], 
  node['nginx']['log3'] ].each do |path|
  directory path do
     owner 'root'
     group 'root'
     mode  '750'
     action :create
     not_if { ::Dir.exist?(path) }
  end
end

## 3. In teradata_logs, generate a random number of files
#     (between 10 and 100). These files should contain
#     dummy/placeholder text data.'
#
bash 'files' do
  cwd node['nginx']['log']
  code <<-EOH
for i in {1..50} 
do
r=$(( $RANDOM % ( 100 - 10 + 1 ) + 10 ))
touch file$r.txt
< /dev/urandom tr -dc "\t\n [:alnum:]" | head -c1000 > file$r.txt
done
          EOH
end

#
## 4. Ordering alphabetically, copy all but last 3 log files
#     in teradate_logs to new_log_dir1
#

bash 'minus3' do
  cwd node['nginx']['log']
  code <<-EOH
# Legend
# nf = Number of Files
# lf = Last file count
# al = All files names by time stamp
#
nf=`ls | wc -l`
lf=$(( $nf - 3 ))
al=`ls -t`
for i in $al
do
for j in $nf
do
if [[ "$lf" < "$nf" ]] || [[ "$lt" == "$nf" ]];
then
  exit 0
fi
cp "#{node['nginx']['log']}/$j #{node['nginx']['log1']}/$j"
nf=$(( $nf - 1 ))
done
done
         EOH
end

#
## 5. Ordering alphabetically, copy only the last 3 log files
#     in teradata_logs to new_log-dir2
#

bash 'last3' do
  cwd node['nginx']['log']
  code <<-EOH
# Legend
# nf = Number of Files
# lf = Last file count
# al = All files names by time stamp
#
nf=`ls | wc -l`
lf=$(( $nf - 3 ))
al=`ls -t`
for i in $al
do
for j in $nf
do
if [[ "$lf" < "$nf" ]] || [[ "$lt" == "$nf" ]];
then
cp "#{node['nginx']['log']}/$j #{node['nginx']['log2']}/$j"
nf=$(( $nf - 1 ))
fi 
done
done
         EOH
end


#
## 6. Create an index.html file for your nginx web server:
#         a. The index.html file should contain clickable
#            links for new_log_dir1 and new_log_dir2.
#
#         b. These links allow the user to browse the contents
#            of new_log_dir1 and new_log_dir2 in their browser.
#
#         c. The user should be able to click on the individual
#            log files and view their contents from a web browser

cookbook_file node['nginx']['local_file_path'] do
   source node['nginx']['src_file']
   owner 'root'
   group 'root'
   mode  '0644'
   action :create
end

service 'nginx' do
   action [:enable, :start]
end

#
## 7. Submission must execute from the command-line, and the 
#     results must be in the form of a running nginx web server
#     that allows a web browser client to view the directory
#     contents and click / view the individual log files.
#
