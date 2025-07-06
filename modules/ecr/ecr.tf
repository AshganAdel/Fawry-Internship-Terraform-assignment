resource "aws_ecrpublic_repository" "my_ecr_repo" {
  repository_name = "poc-prod-my-ecr-repo" 

  image_scanning_configuration {
    scan_on_push = true                   
  }
}
resource "aws_ecrpublic_repository_policy" "allow_public_read" {
  repository = aws_ecrpublic_repository.my_ecr_repo.poc-prod-my-ecr-repo

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
