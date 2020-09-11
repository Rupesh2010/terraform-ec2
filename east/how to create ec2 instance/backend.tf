terraform {
  backend "s3" {
    bucket = "rupesh-terraform-2020"
    key    = "appname/terraform/tf.state"
    region = "us-east-1"
  }
}
