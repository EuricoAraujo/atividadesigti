from pyspark.sql import SparkSession

spark = (SparkSession.builder.appName("exercicio1")
    .getOrCreate()
)

#carregar os dados
from botocore.exceptions import ClientError
import boto3

s3 = boto3.resource('s3')
data = open('../data/DADOS/MICRODADOS_ENEM_2020.csv', 'rb')
s3.Bucket('datalake-eurico-atv1').put_object(Key='raw-data/enem2020.csv', Body=data)

# Leitura de dados
enem = (
    spark.read.format("csv")
    .option("inferSchema", True)
    .option("header", True)
    .option("delimiter", ";")
    .load("s3://datalake-eurico-atv1/raw-data/1_parquet_insert.py")
)

(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-eurico-atv1/staging/enem")
)