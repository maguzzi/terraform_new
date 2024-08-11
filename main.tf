terraform {
  backend "local" {
    
  }
}

variable "world_splats" {
  type = list(string)
  default = [ "mercury","venus","earth","mars","jupiter","uranus","neptune","pluto" ]
}

variable "splats" {
  type = list(map(string))
  default = [ {"greek":"Hera","latin":"Juno"}]
}