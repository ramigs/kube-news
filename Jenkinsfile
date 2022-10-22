pipeline {
    agent any

    stages {
        stage ("Build Docker Image") {
            steps {
                script {
                    dockerapp = docker.build("ramigs/kube-news:${env.BUILD_ID}", "-f ./Dockerfile ./")
                }
            }
        }
        stage ("Push Docker Image") {
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com/", "Docker Hub")
                    dockerapp.push("${env.BUILD_ID}")
                    dockerapp.push("latest")
                }
            }
        }
    }
}
