provider "kubernetes" {
config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "mysql"
  }

spec {
    replicas = 1

    selector {
      match_labels = {
        dc = "winterfell"
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
          image = "mysql:5.6"
          name  = "mysql"
        
        env {
        name = "MYSQL_ROOT_PASSWORD"
        value = "chiku"
        }
env {
        name = "MYSQL_DATABASE"
        value = "myinfo"
        }
env {
        name = "MYSQL_USER"
        value = "aks07"
        }
env {
        name = "MYSQL_PASSWORD"
        value = "chiku"
        }
        }
      }
    }
  }
}