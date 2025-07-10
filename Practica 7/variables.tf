variable "vpc_lab_tf_cidr" {
description = "CIDR_lab_tf"
type = string
}

# variable "subnetpublic" {
# description = "CIDR public subnet"
# type = string
# }

# variable "subnetprivate" {
# description = "CIDR private subnet"
# type = string
# }`

variable "subnets" {
    description = "Lista de subnets"
    type = list(string)
}

variable "tags" {
    description = "Tags del proyectos"
    type = map(string)
}