all: build run

run:
	docker-compose -f docker-compose.yml up -d --force-recreate

build:
	docker build -t core:8-jre-slim ./core
	docker build -t spark-core:2.4.0 ./spark/spark-core
	docker build -t spark-master:2.4.0 ./spark/spark-master
	docker build -t spark-worker:2.4.0 ./spark/spark-worker
	docker build -t livy:0.7.0-incubating ./livy
