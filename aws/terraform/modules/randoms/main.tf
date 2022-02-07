resource "random_shuffle" "azs" {
  input = var.az_names
  result_count = var.num_azs
}
