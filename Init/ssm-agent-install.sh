
#!/bin/bash
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl restart amazon-ssm-agent
sudo systemctl status amazon-ssm-agent
rm amazon-ssm-agent.rpm