/**
  A. Initial creation:
    1. terraform init <= run only once in the folder
    2. terraform plan
    3. terraform apply

  B. Update:
    1. Add file_permission = "0700" => removes permission for everyone else except the owner
    Terraform will delete the file and re-create it with the new changes
    2. terraform plan
    3. terraform apply

  C. Destroy:
    Removes all resources in the current config directory
*/
resource "local_file" "pet" {
  filename = "root/pets.txt"
  content = "We love pets!"
  file_permission = "0700"
}