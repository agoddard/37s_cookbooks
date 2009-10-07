nginx Mash.new unless attribute?("nginx")

nginx[:dir]     = "/etc/nginx"
nginx[:log_dir] = "/var/log/nginx"
nginx[:user]    = "www-data"
nginx[:binary]  = "/usr/sbin/nginx"

nginx[:gzip] = "on"               unless attribute?("nginx_gzip")
nginx[:gzip_http_version] = "1.0" unless attribute?("nginx_gzip_http_version")
nginx[:gzip_comp_level] = "2"     unless attribute?("nginx_gzip_comp_level")
nginx[:gzip_proxied] = "any"      unless attribute?("nginx_gzip_proxied")
nginx[:gzip_types] = [ "text/plain", "text/html", "text/css", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript" ] unless attribute?("nginx_gzip_types")

nginx[:keepalive] = "off"       unless attribute?("nginx_keepalive")
nginx[:keepalive_timeout] = 65 unless attribute?("nginx_keepalive_timeout")

nginx[:worker_processes] = 1               unless attribute?("nginx_worker_processes")
nginx[:worker_connections] = 1024          unless attribute?("nginx_worker_connections")
nginx[:server_names_hash_bucket_size] = 64 unless attribute?("nginx_server_names_hash_bucket_size")

default.nginx[:expires] = Mash.new
default.nginx[:expires][:enabled] = true
default.nginx[:expires][:regex] = '\.(ico|css|js|gif|jpe?g|png)$'
default.nginx[:expires][:time] = "max"

nginx[:extras] = ['headers']
nginx[:helpers] = ['expires', 'lb_filter']