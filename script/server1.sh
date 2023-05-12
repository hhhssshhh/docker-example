docker run -d --name my_pthon_web \ 
--net=myweb-network \ 
python_server:$1

rm -f ../nginx/nginx-conf.d/*
cp ../nginx_conf/server1.conf ../nginx/nginx-conf.d/config.conf

docker kill -s HUP myweb-nginx

if [ "$(docker ps -q -f name=my_python_web2\$)" ]; then
    docker stop my_python_web2
    docker rm my_pthon_web2
fi