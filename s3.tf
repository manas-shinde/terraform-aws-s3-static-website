resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "my_static_website" {
  bucket = "my_static_site_${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.my_static_website.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.my_static_website.arn}/*"
        }
      ]
    }
  )
}
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.my_static_website.id

  index_document {
    suffix = "index.html"
  }
}
