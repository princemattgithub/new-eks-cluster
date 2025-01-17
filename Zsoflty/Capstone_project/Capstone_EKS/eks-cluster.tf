module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = var.clusterName
  cluster_version = "1.29"

  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  cluster_endpoint_public_access = true

  tags = {
    environment = "development"
    application = "capstone-eks"
  }

  eks_managed_node_groups = {
    capstone_one = {
        min_size = 1
        max_size = 3
        desired_size = 2

        instance_types = ["t2.small"]
    }

    capstone_two = {
        min_size = 1
        max_size = 2
        desired_size = 1

        instance_types = ["t3.medium"] 
    }
  }
}