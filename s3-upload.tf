resource "aws_s3_object" "object-upload-html" {
  for_each = fileset("uploads/", "**/*")
  bucket   = data.aws_s3_bucket.selected-bucket.bucket
  key      = each.value
  source   = "uploads/${each.value}"
  content_type = lookup(
    {
      "html" = "text/html"
      "css"  = "text/css"
      "js"   = "application/javascript"
      "png"  = "image/png"
      "jpg"  = "image/jpeg"
      "jpeg" = "image/jpeg"
      "gif"  = "image/gif"
      "svg"  = "image/svg+xml"
      "pdf"  = "application/pdf"
      "txt"  = "text/plain"
    },
    regex("\\.(\\w+)$", each.value)[0],
    "binary/octet-stream"
  )

  etag = filemd5("uploads/${each.value}")
  acl  = "public-read"
}
/*
resource "aws_s3_object" "object-upload-jpg" {
    for_each        = fileset("uploads/", "*")
    bucket          = data.aws_s3_bucket.selected-bucket.bucket
    key             = each.value
    source          = "uploads/mediplus-lite/${each.value}"
    content_type    = "image/jpeg"
    etag            = filemd5("uploads/mediplus.lite/${each.value}")
    acl             = "public-read"
}
*/