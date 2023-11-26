data "template_file" "init_data" {
  template = "${file("${path.module}/scripts/user_data.sh")}"

  vars = {
    TIMDb_API_KEY = "${var.TIMDb_API_KEY}"
  }
}