project = "learn-gke-444221"
region  = "us-central1"
apis = ["cloudresourcemanager.googleapis.com",
"container.googleapis.com"]
vpc_network                  = "gke-vpc-network"
subnet-us-central1           = "subnet-usc1"
subnet_cidr_uscentral1       = "10.128.0.0/20"
pod-range-us-central1        = "pod-range-us-central1"
cidr-pod-us-central1         = "10.1.0.0/21"
service-range-us-central1    = "service-range-us-central1"
cidr-service-us-central1     = "10.2.0.0/21"
gke-cluster1-name            = "gke-cluster-1"
master_ipv4_cidr_block       = "10.3.0.0/28"
pods_cluster_ipv4_cidr_block = "10.1.0.0/21"
services_ipv4_cidr_block     = "10.2.0.0/21"


