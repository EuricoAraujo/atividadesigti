resource "aws_s3_bucket_object" "parquet_insert" {
    bucket = aws_s3_bucket.datalake-eurico-atv1.id
    key = "raw-data/1_parquet_insert.py"
    acl = "private"
    source = "../etl/1_parquet_insert.py"
    etag = filemd5("../etl/1_parquet_insert.py")  
}

