package "Install Apache" do
  case node[:platform]
  when 'centos'
    package_name "httpd"
    action :install
  when 'ubuntu'
    package_name 'apache2'
    action :install
  end
end

#package "apache2" do 
#  case node[:platform]
#  action :install
#end

service "Service Apache" do
  case node[:platform]
  when 'centos'
    service_name "httpd"
  when 'ubuntu'
    service_name 'apache2'
  end
  action [ :enable, :start ]
end


##service "apache2" do
##  action [ :enable, :start ]
##end

template "/var/www/html/index.html" do 
  source 'index.html.erb'
  mode '0644'
end
