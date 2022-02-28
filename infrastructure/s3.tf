resource "aws_s3_bucket" "datalake-eurico-atv1"{
    bucket = "datalake-eurico-atv1"
    acl = "private"
  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}

