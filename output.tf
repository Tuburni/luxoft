output "grafana_url" {
  value = "http://${aws_instance.grafana_instance.public_ip}:3000/dashboard"
}
