docker run -d --name my_pthon_web2 \ 
--net=myweb-network \ 
python_server:$1

rm -f ../nginx/nginx-conf.d/*
cp ../nginx_conf/server2.conf ../nginx/nginx-conf.d/config.conf

docker kill -s HUP myweb-nginx

if [ "$(docker ps -a -q -f name=my_python_web\$)" ]; then
    docker stop my_python_web
    docker rm my_pthon_web
fi