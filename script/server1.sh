docker run -d --name my_python_web --net=myweb-network python_server:0.1

rm ./nginx/nginx-conf.d/*
cp ../nginx_conf/server1.conf ./nginx/nginx-conf.d/config.conf

docker kill -s HUP myweb-nginx

docker stop my_python_web2
docker rm my_python_web2