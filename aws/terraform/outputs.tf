output "public_source_ip" {
  value = data.external.public-source-ip.result.public_source_ip
  description = "Public source IP of terraform controller"
}