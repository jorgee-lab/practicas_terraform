resource "aws_s3_bucket" "maximo-bucket" {
  bucket = local.s3-sufix

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
}