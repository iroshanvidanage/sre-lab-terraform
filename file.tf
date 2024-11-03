# create a file
resource "local_file" "file_text" {
  content  = "Iroshan"
  filename = "./files/sample.txt"
}

# hide sensitive information
resource "local_file" "file_sensitive" {
  content  = var.sensitive_content
  filename = "./files/sensitive.txt"
}

# can use this resource file to if the content is sensitive
resource "local_sensitive_file" "file_sensitive" {
  content  = "password"
  filename = "./files/sensitive_file.txt"
}