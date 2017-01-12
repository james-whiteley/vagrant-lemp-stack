package "php_packages" do
  package_name [
    'php7.0-fpm',
    'php7.0-mysql',
    'php7.0-curl',
    'php7.0-gd',
    'php7.0-intl',
    'php-pear',
    'php-imagick',
    'php7.0-imap',
    'php7.0-mcrypt',
    'php-memcache',
    'php7.0-pspell',
    'php7.0-recode',
    'php7.0-sqlite3',
    'php7.0-tidy',
    'php7.0-xmlrpc',
    'php7.0-xsl',
    'php7.0-mbstring',
    'php-gettext',
    'php-apcu'
  ]
  action :install
  notifies :run, 'bash[configure_php]', :immediately
end

bash 'configure_php' do
  only_if { ::File.exist?('/etc/php/7.0/fpm/php.ini') }
  code <<-EOH
    sudo sed -i "s/cgi.fix_pathinfo = .*/cgi.fix_pathinfo = 0/" /etc/php/7.0/fpm/php.ini
    EOH
  action :nothing
  notifies :reload, 'service[php7.0-fpm]', :immediately
end

service 'php7.0-fpm' do
  action :nothing
end