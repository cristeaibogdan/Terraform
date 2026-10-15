resource "local_file" "pet" {
  filename = "root/pets.txt"
  content = "My favourite pet is Mr. Whiskers!"
}

resource "random_pet" "my-pet" {
  prefix = "Mrs"
  separator = "."
  length = 2
}

