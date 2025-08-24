
variable "aks_name" {}
variable "rg_name" {}
variable "location" {}
variable "dns_prefix" {}
variable "tags" {}
variable "node_count" {
  default = 1
}
variable "vm_size" {
  default = "Standard_DS2_v2"
}