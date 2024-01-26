resource "aws_s3_bucket" "gitlab_bucket" {
    bucket = "gitlab-bucket-33310"
    
    tags = {
      Name = "Stores-gitlab-artifacts"
    }
}

resource "aws_s3_bucket_versioning" "gitlab-Bucket-version" {
    bucket = aws_s3_bucket.gitlab_bucket.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "gitlab-bucket-encrypt" {
    bucket = aws_s3_bucket.gitlab_bucket.id
    rule {
      apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.mykey.arn   # As of not not having KMS key to use this
      sse_algorithm     = "AES256"
    }
    }
}

/*  INVESTIGATE WHY THE ERROR COMING

ERROR =  Error: creating S3 Bucket (gitlab-bucket-33310) ACL: operation error S3: PutBucketAcl, https response error StatusCode: 400, RequestID: 5QS2TNRTMZ77Y8NX, HostID: aiPLi4uLdTNGcwrWOBUxpQdYPIuhAgay/8jcV8N6/itoHsMEm951N3WC3Q/bk5XBjke8eNpD2g8=, api error AccessControlListNotSupported: The bucket does not allow ACLs

resource "aws_s3_bucket_acl" "gitlab-bucket-acl" {
    bucket = aws_s3_bucket.gitlab_bucket.id
    acl = "private"
  
} */   


# -----------------------

#Below we are defining the Ec2 instance that depends on S3.check

resource "aws_instance" "gitlab-server" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    tags = {
      Name = "gitlab-server"
    }

    depends_on = [aws_s3_bucket.gitlab_bucket ]
}












