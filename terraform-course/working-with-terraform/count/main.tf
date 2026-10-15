resource "local_file" "pet" {
  filename = var.filenames[count.index]
  content = "something!"
  count = length(var.filenames)
}