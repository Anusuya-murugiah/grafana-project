resource "aws_instance" "ec2" {
   ami =
   instance_type = var.instance_type
   key_name = var.key_name
   subnet_id = 
   vpc_security_group_ids =
   iam_instance_profile =
   tags = {
     Name = var.instance_name
   }
   root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./scripts/tools-install.sh",{})
  }
