#!/bin/bash

sudo mkdir -p ./server/grafana
sudo chown -R 472:472 ./server/grafana

sudo mkdir -p ./server/influxdb
sudo chown -R influxdb:influxdb ./server/influxdb

touch ./server/telegraf.conf

docker-compose up -d

echo "Grafana: http://127.0.0.1:3000"
echo "Influxdb: http://influxdb:8086"

echo
echo "Current database list"
curl -G http://172.22.0.3:8086/query?pretty=true --data-urlencode "db=plantdb" --data-urlencode "q=SHOW DATABASES"

# echo
# echo "Create a new database ?"
# echo "curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE mydb'"
