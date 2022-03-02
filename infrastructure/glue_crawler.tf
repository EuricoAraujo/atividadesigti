resource "aws_glue_catalog_database" "atividade1" {
  name = "atividade1"
}

resource "aws_glue_crawler" "atividade1" {
  database_name = aws_glue_catalog_database.atividade1.name
  name          = "atividade1"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.atividade1.bucket}"
  }

  configuration = <<EOF
{
   "Version": 1.0,
   "Grouping": {
      "TableGroupingPolicy": "CombineCompatibleSchemas" }
}
EOF

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}
