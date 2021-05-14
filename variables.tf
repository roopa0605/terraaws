variable "bastion_ami_id" {
    type = string
    default = "ami-010aff33ed5991201"
 }

variable "bastion_instance_type" {
    type = string
   default =   "t2.micro"
}

variable "bastion_keypair_name" {
    type = string
   default = "terraaws"
}

variable "bastion_volume_type" {
    type = string
    default = "gp2"
 }

variable "bastion_volume_size" {
    type = number
    default = 8
     }





