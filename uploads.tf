resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.my_static_website.bucket
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.my_static_website.bucket
  source       = "./style.css"
  key          = "style.css"
  content_type = "text/css"
}