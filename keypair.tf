# ------------------------------------------------------------------------------
# Create SSH Keypair
# ------------------------------------------------------------------------------

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "kevin-keypair"
  public_key = "${file("${var.key_path}")}"
}
