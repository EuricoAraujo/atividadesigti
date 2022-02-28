from pyspark.sql import SparkSession

spark = (SparkSession.builder.appName("exercicio1")
    .getOrCreate()
)


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