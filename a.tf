provider "kubernetes" {
  config_context_cluster   = "minikube"
}


resource "kubernetes_replication_controller" "myrc1" {
  metadata {
    name = "mywp1"
  }

  spec {
    replicas = 1
    selector = {
      env="north",
      dc="winterfell",
      app="webserver"
    }
    template {
      metadata {
        labels = {
	      env="north",
	      dc="winterfell",
	      app="webserver"

        }
        annotations = {
          "key1" = "value1"
        }
      }

      spec {
        container {
          image = "wordpress:4.8-apache"
          name  = "mywp1"
		}
	}
}
}
}