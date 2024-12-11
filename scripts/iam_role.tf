resource "aws_iam_role" "iam_role" {
  name = var.iam_role_name
  assume_role_policy = <<EOF
{
  "Version" = "2012-10-17"
  "Statement" : [
     {
     "Effect" : "Allow",
     "Principal" : {
        "Service" : "ec2.amazon.com"
      },
     "Action" : "sts.AssumeRole"
      }
    ]
  }
EOF
}

resource "aws_iam_policy" "ecr_access_policy" {
   description = "policy allow EC2 to ECR"
   name = "ECRACCESSPOLICY"
   policy = <<EOF
 {
   "Version" = "2012-10-17"
   "Statement" : [
       {
      "Effect" : "Allow",
      "Action" : [ 
         "ecr:GetAuthorization",
         "ecr:BatchCheckLayerAvailability",
         "ecr:GetRepositoryPolicy"
         "ecr:ListImages,
         "ecr:BatchGetImage,
         "ecr:InitiateLayerUpload,
         "ecr:UploadLayerPart",
         "ecr:CompleteLayerUpload",
         "ecr:PutImage"
       ],
      "Resource" : "*"
     }
  ]
 }
 EOF
 }

resource "aws_iam_role_policy_attachment" "ecr_policy_attachment" {
  policy_arn = aws_iam_policy.ecr_access_policy.arn
  role       = aws_iam_role.iam_role.name
}
  
  
 

  

        
     
  
    
