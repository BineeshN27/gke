variable "project" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "apis" {
  type    = list(string)
  default = []
}

variable "vpc_network" {
  type    = string
  default = ""
}

variable "subnet-us-central1" {
  type    = string
  default = ""
}

variable "subnet_cidr_uscentral1" {
  type    = string
  default = ""
}

variable "pod-range-us-central1" {
  type    = string
  default = ""
}

variable "cidr-pod-us-central1" {
  type    = string
  default = ""
}

variable "service-range-us-central1" {
  type    = string
  default = ""
}

variable "cidr-service-us-central1" {
  type    = string
  default = ""
}

variable "gke-cluster1-name" {
  type    = string
  default = ""
}

variable "master_ipv4_cidr_block" {
  type    = string
  default = ""
}

variable "pods_cluster_ipv4_cidr_block" {
  type    = string
  default = ""
}

variable "services_ipv4_cidr_block" {
  type    = string
  default = ""
}



