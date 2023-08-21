pipeline {
    environment {
        DOCKERHUB_CREDENTIALS= credentials('docker-hub-credentials')     
    }
    agent any
    stages {
        stage('Login to Docker Hub'){
            steps {
                script {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login --usermame crymeariver33 -S'
			echo 'Login Completed'
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
		    echo 'Push the image'
            }
        }
    }
}
