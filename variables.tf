variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "my-key-pair"
}

variable "public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "/home/ubuntu/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to the SSH private key file"
  type        = string
  default     = "/home/ubuntu/.ssh/id_rsa"
}

variable "ami_id" {
  description = "AMI ID of the desired image"
  type        = string
  default     = "ami-0ec7f9846da6b0f61"  # Replace with your desired AMI ID
}
