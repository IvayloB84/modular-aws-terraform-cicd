import {
  to = aws_vpc.sis-vpc
  id = "vpc-082560524e15b9feb"
}

import {
  to = aws_internet_gateway.sis-igw
  id = "igw-02cefa6ae7a9f07d5"
}

import {
  to = aws_instance.sis-web
  id = "i-088f8084584ca7f86"
}

import {
  to = aws_instance.sis-bastion-host
  id = "i-05d3e1163dca9a3a8"
}

import {
  to = aws_rds_cluster.sis-main-cluster
  id = "sis"
}

import {
  to = aws_rds_cluster_instance.sis-main-db
  id = "sis-instance-1"
}

import {
  to = aws_db_subnet_group.sis-bastion-group
  id = "private-subnet-group"
}

# import {
#   to = aws_s3_bucket.sis-bucket
#   id = "sis.amexis.net"
# }

# import {
#   to = aws_kms_key.sis-key-s3
#   id = "56fa2e18-7b98-4102-b5a2-deef3b1fed12"
# }

# import {
#   to = aws_s3_bucket_ownership_controls.ownership
#   id = "sis.amexis.net"
# }

# import {
#   to = aws_s3_bucket_public_access_block.public_access
#   id = "sis.amexis.net"
# }

# import {
#   to = aws_s3_bucket_server_side_encryption_configuration.sis_sse_key
#   id = "sis.amexis.net"
# }

# import {
#  to = aws_s3_bucket_website_configuration.sis-website-rule
#  id = "sis.amexis.net"
# }

#  import {
#  to = aws_kms_alias.sis-key-s3-alias
#  id = "alias/sis_amexis_key"
# }

import {
  to = aws_s3_bucket.sis-dev-s3-bucket
  id = "dev.sis.amexis.net"
}

import {
  to = aws_s3_bucket_public_access_block.dev_public_access
  id = "dev.sis.amexis.net"
}

import {
 to = aws_s3_bucket_website_configuration.sis-dev-website-rule
 id = "dev.sis.amexis.net"
}

import {
 to = aws_security_group.default
 id = "sg-033a4975f73945f5d"
}

import {
 to = aws_security_group.bastion-sg
 id = "sg-0c4f96574a064521b"
}

import {
 to = aws_security_group.web-sg
 id = "sg-0078f099e5b62a3e0"
}

import {
 to = aws_security_group.private-subnet-rds-sg
 id = "sg-0ea20e5530ce33f84"
}

import {
 to = aws_subnet.sis-public-subnet-1
 id = "subnet-0ece35de743a43d7a"
}

import {
 to = aws_subnet.sis-public-subnet-2
 id = "subnet-0d9cbcce6375f43da"
}

# import {
#  to = aws_default_route_table.sis-public_rt
#  id = "rtb-0f34857f0f44b6326"
# }

import { 
  to = aws_route_table_association.sis-public_rt
  id = "subnet-0ece35de743a43d7a/rtb-0f34857f0f44b6326"
}

import {
 to = aws_route_table.sis-private_rt
 id = "rtb-07f181bf4cf112364"
}

import {
 to = aws_route_table.private-rds-rt
 id = "rtb-04f1e4630ed1bac06"
}

# import {
# to = aws_subnet.sis-private-subnet-assoc1a
# id = "subnet-08b33de731d73ef0c"
# }

# import {
# to = aws_subnet.sis-private-subnet-assoc1c
# id = "subnet-09bd7fc44e4be826c"
# }

# import {
# to = aws_subnet.sis-private-subnet-assoc1b
# id = "subnet-084f46c393d5e8a60"
# }

import { 
  to = aws_route_table_association.sis-private-subnet-assoc1a
  id = "subnet-08b33de731d73ef0c/rtb-04f1e4630ed1bac06"
}

import { 
  to = aws_route_table_association.sis-private-subnet-assoc1b
  id = "subnet-084f46c393d5e8a60/rtb-04f1e4630ed1bac06"
}

import { 
  to = aws_route_table_association.sis-private-subnet-assoc1c
  id = "subnet-09bd7fc44e4be826c/rtb-04f1e4630ed1bac06"
}

import {
to = aws_subnet.private-subnet-1a
id = "subnet-08b33de731d73ef0c"
}

# import {
# to = aws_subnet.private-subnet-1b
# id = "subnet-08b33de731d73ef0c"
# }

import {
to = aws_subnet.private-subnet-1c
id = "subnet-09bd7fc44e4be826c"
}

 import {
   to = aws_cloudfront_distribution.sis-cf-dist
   id = "E109QA9W89PTRL"
 }

 import {
   to = aws_cloudfront_origin_access_identity.oai
   id = "E11LTMS60O0SDL"
 }

 import {
   to = aws_acm_certificate.cert
   id = "arn:aws:acm:us-east-1:914978342626:certificate/72344418-a2ac-4411-8de6-a4b5d5b238a1"
 }

  import {
   to = aws_route53_record.sis-certvalidation
   id = "Z0164917FMMQ1KMSJ4EY__e4942f7d9ae789b869ecafff25ec1b9b.sis.amexis.net_CNAME"
 }

  import {
   to = aws_route53_record.websiteurl
   id = "Z0164917FMMQ1KMSJ4EY_sis.amexis.net_A"
 }

 import {
 to = aws_kms_alias.dev-sis-key-s3-alias
 id = "alias/dev-sis_amexis_key"
}

 import {
 to = aws_iam_role.sis-dev-web-server-role
 id = "sis-dev-web-server-role"
}

 import {
 to = aws_iam_role.sis-dev-bastion-role
 id = "sis-dev-bastion-role"
}

import {
  to = aws_s3_bucket.sis-files-dev
  id = "sis-files-dev"
}

import {
  to = aws_s3_bucket.sis-pdf-files-dev
  id = "sis-pdf-files-dev"
}

import {
  to = aws_s3_bucket.sis-pdf-templates-dev
  id = "sis-pdf-templates-dev"
}

# import {
#   to = aws_s3_bucket.sis-pdf-generation-packages
#   id = "sis-pdf-generation-packages"
# }

import {
  to = aws_lambda_layer_version.pdf-generation-packages
  id = "arn:aws:lambda:eu-central-1:914978342626:layer:pdf-generation-packages:3"
}

import {
  to = aws_lambda_function.pdf-generation-dev
  id = "pdf-generation-dev"
}

 import {
 to = aws_iam_role.pdf-generation-dev-role-wdnryyl4
 id = "pdf-generation-dev-role-wdnryyl4"
}

import {
  to = aws_iam_user_policy_attachment.sisadmin
  id = "sisadmin/arn:aws:iam::914978342626:policy/DB-Aurora-User"
}

import {
  to = aws_iam_user.sisadmin
  id = "sisadmin"
}

import {
  to = aws_iam_group.developers
  id = "Developers"
}

import {
  to = aws_lambda_function_url.pdf-generation-dev
  id = "pdf-generation-dev"
}