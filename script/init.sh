docker network create myweb-network

mkdir -p nginx/nginx-conf.d

cp ../nginx_conf/nginx.conf nginx/nginx.conf
echo "" > nginx/nginx-conf.d/temp

docker run --name myweb-nginx \
--mount type=bind,source="$(pwd)/nginx/nginx-conf.d",target=/etc/nginx/conf.d \
--mount type=bind,source="$(pwd)/nginx/nginx.conf",target=/etc/nginx/nginx.conf \
--net myweb-network \
-p 30088:4242 -d \
nginx