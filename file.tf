# create a file
resource "local_file" "file_text" {
  content  = "Iroshan"
  filename = "./files/sample.txt"
}