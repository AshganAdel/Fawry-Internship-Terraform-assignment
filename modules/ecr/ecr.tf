resource "aws_ecr_repository" "example" {
    name                 = "poc-prod-my-ecr-repo" # Replace with your desired repository name
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
}
