all: build run

run:
	docker-compose -f docker-compose.yml up -d --force-recreate

build:
	docker build -t core ./core
	docker build -t spark-core ./spark/spark-core
	docker build -t spark-master ./spark/spark-master
	docker build -t spark-worker ./spark/spark-worker
	docker build -t livy ./livy
