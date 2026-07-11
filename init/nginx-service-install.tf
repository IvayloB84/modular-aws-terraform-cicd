data "template_file" "nginx-config" {
 template = file("../init/nginx-service-install.sh")
}