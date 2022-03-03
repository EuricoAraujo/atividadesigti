resource "aws_s3_bucket_object" "parquet_insert" {
    bucket = aws_s3_bucket.datalake-eurico-atv1.id
    key = "raw-data/1_parquet_insert.py"
    acl = "private"
    source = "../etl/1_parquet_insert.py"
    etag = filemd5("../etl/1_parquet_insert.py")  
}


resource "aws_s3_bucket_object" "arquivos_csv_enem_2020" {
    bucket = aws_s3_bucket.datalake-eurico-atv1.id
    key = "raw-data/enem2020.csv"
    acl = "private"
    source = "../data/DADOS/MICRODADOS_ENEM_2020.csv"
    etag = filemd5("../data/DADOS/MICRODADOS_ENEM_2020.csv")  
}