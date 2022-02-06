server {
    listen {{ .interface }}:{{ .port }} default_server;

    include /etc/nginx/includes/server_params.conf;
    include /etc/nginx/includes/proxy_params.conf;

    location / {
        allow   172.30.32.2;
        deny    all;

        proxy_pass http://backend/endpoint/ui/;
        proxy_intercept_errors on;
        error_page 301 302 307 = @handle_redirect;
    }

    location @handle_redirect {
        set $saved_redirect_location '$upstream_http_location';
        proxy_pass http://backend$saved_redirect_location;
    }
}
