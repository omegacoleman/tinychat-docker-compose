cd /data
redis-server ./redis.conf
pm2 start /tinychat/client-webui/invreg/server.js
nginx -c /data/nginx.conf
while [ 1 ]
do
	/tinychat/build/bin/websocket-server --host 0.0.0.0 --port 8000 --db-redis 127.0.0.1 --redis-port 6379 >> ./tinychat.log
done

