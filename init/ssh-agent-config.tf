data "template_file" "startup" {
 template = file("../init/ssm-agent-install.sh")
}