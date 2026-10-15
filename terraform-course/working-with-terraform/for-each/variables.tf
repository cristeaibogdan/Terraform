variable "filenames" {
  type = set(string)
  default = [
    "root/pets.txt",
    "root/dogs.txt",
    "root/cats.txt"
  ]
}