variable "mykey" {
  default = "first-key"
}

variable "instancetype" {
  default = "t3a.medium"
}
variable "tag" {
  default = "Jenkins_Server_bekir"
}
variable "jenkins-sg" {
  default = "jenkins-server-sec-gr-208"
}

variable "user" {
  default = "okutan"
}