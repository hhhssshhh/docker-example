docker run -d --name my_python_web2 --net=myweb-network python_server:0.2

rm ./nginx/nginx-conf.d/*
cp ../nginx_conf/server2.conf ./nginx/nginx-conf.d/config.conf

docker kill -s HUP myweb-nginx

docker stop my_python_web
docker rm my_python_web