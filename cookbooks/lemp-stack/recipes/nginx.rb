package 'nginx' do
  action :install
  notifies :delete, 'file[/etc/nginx/sites-enabled/default]', :immediately
  notifies :delete, 'file[/var/www/html/index.nginx-debian.html]', :immediately
  notifies :create, 'template[/etc/nginx/sites-enabled/vhost]', :immediately
end

file '/etc/nginx/sites-enabled/default' do
  only_if { ::File.exist?('/etc/nginx/sites-enabled/default') }
  action :nothing
end

file '/var/www/html/index.nginx-debian.html' do
  only_if { ::File.exist?('/var/www/html/index.nginx-debian.html') }
  action :nothing
end

template '/etc/nginx/sites-enabled/vhost' do
  source 'vhost.erb'
  owner 'root'
  group 'root'
  mode '0744'
  action :nothing
  notifies :reload, 'service[nginx]', :immediately
end

service 'nginx' do
  action :nothing
end