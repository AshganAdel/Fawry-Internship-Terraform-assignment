provider "aws" {
  alias  = "public"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "my_ecr_repo" {
  provider        = aws.public
  repository_name = "poc-prod-my-ecr-repo" 
}
resource "aws_ecrpublic_repository_policy" "allow_public_read" {
  repository_name = aws_ecrpublic_repository.my_ecr_repo.id

  policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Sid       = "AllowPull"
        Effect    = "Allow"
        Principal = { AWS = "*" }             
        Action    = [
          "ecr-public:BatchCheckLayerAvailability",
          "ecr-public:GetDownloadUrlForLayer",
          "ecr-public:BatchGetImage"
        ]
      }
    ]
  })
}
