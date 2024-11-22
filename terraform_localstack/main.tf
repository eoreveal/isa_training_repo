terraform {
 required_providers {   
   docker = {     
     source  = "kreuzwerker/docker"     
     version = "3.0.2"   
    } 
  }
}

resource "docker_image" "localstack" {
  name         = "localstack/localstack"
  keep_locally = false
}

resource "docker_container" "localstack" {
  name  = "localstack"  
  image = docker_image.localstack.name  
  
  ports {
      internal = 4566    
      external = 4566  
  }  
  
  env = [    
    "SERVICES=s3,iam",    
    "EDGE_PORT=4566",  
  ]
}