pipeline {
    environment {
        DOCKERHUB_CREDENTIALS= credentials('docker-hub-credentials')     
    }
    agent { any }
    stages {
        stage('Initialize'){
            steps {
                script {
                    docker.withRegistry(registry, registryCredential)
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build - < Dockerfile -t crymariver33/yocto_wandboard:0.1 .'     
	            echo 'Build Image Completed'
            }
        }
        stage('Push Image') {
            steps {
            }
        }
    }
}
