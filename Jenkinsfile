pipeline {
    agent any

    stages {
        stage ("Build Docker Image") {
            steps {
                script {
                    dockerapp = docker.build("ramigs/kube-news:v${env.BUILD_ID}", "-f ./Dockerfile ./")
                }
            }
        }
        stage ("Push Docker Image") {
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com/", "Docker Hub") {
                        dockerapp.push("v${env.BUILD_ID}")
                        dockerapp.push("latest")
                    }
                }
            }
        }
        stage ("Deploy to Kubernetes") {
            steps {
                withKubeConfig([credentialsId:"kubeconfig"]) {
                    sh 'kubectl apply -f ./k8s/deployment.yaml'
                }
            }
        }
    }
}
