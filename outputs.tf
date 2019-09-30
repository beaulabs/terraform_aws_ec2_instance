output "public_dns" {
  value = aws_instance.ubuntu.public_dns
}

output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "primary_ssh_string" {
  description = "Copy paste this string to SSH into the primary."
  value       = "ssh -i ${var.myaws_keypair}.pem ubuntu@${aws_instance.ubuntu.public_ip}"
}

