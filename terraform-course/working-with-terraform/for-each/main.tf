resource "local_file" "pet" {
  filename = each.value
  content = "something!"
  for_each = var.filenames
}