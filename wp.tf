provider "kubernetes" {
config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "mywp"
  }

spec {
    replicas = 1

    selector {
      match_expressions {
        key = "dc"
        operator = "In"
        values = ["The_wall" , "winterfell"] 

}     
    }


    template {
      metadata {
        labels = {
          dc = "winterfell"
        }
      }

      spec {
        container {
          image = "wordpress:4.8-apache"
          name  = "mywp"
        
           }
      }
    }
  }
}