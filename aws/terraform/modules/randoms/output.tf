output "chosen_az_names" {
  value = random_shuffle.azs.result
  description = "Randomly chosen AZs"
}