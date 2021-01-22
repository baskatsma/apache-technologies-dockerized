import wget
from pyspark.sql import SparkSession

if __name__ == "__main__":
	spark = spark = SparkSession.\
        	builder.\
 	       	appName("pyspark-test").\
        	master("spark://spark-master:7077").\
 	      	config("spark.executor.memory", "512m").\
        	getOrCreate()
	
	url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
	wget.download(url)

	data = spark.read.csv("iris.data")
	print(data.show(n=5))
