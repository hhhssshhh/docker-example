docker network create myweb-network

rm -rf ../nginx/nginx-conf.d
mkdir -p ../nginx/nginx-conf.d
rm -rf ../nginx/nginx.conf

cp ../nginx_conf/nginx.conf ../nginx/nginx.conf
echo "" > ../nginx/nginx-conf.d/temp

docker run --name myweb-nginx \
-v ../nginx_conf/nginx-conf.d:/etc/nginx/conf.d \
-v ../nginx_conf:/etc/nginx-settings \
--net=myweb-network \
-p 30088:4242 -d \
nginx

docker exec myweb-nginx rm /etc/nginx/nginx.conf
docker exec myweb-nginx ln -s /etc/nginx-settings/nginx.conf /etc/nginx/nginx.conf