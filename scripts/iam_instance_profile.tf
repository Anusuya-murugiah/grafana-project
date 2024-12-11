resource "aws_iam_instance_profile" "instance_profile" {
   name = "jenkins-server-instance-profile"
   role = aws_iam_role.iam_role.name
}
