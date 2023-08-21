pipeline {
  	agent any

	environment {
		
		DOCKERHUB_CREDENTIALS= credentials('docker-hub-credentials')     
	}
	stages {
		stage('Login to Docker Hub'){
		    steps {
			script {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
				echo 'Login Completed'
			}
		    }
		}
		stage('Build Docker Image') {
		    steps {
			    	sh 'docker build - < Dockerfile -t crymariver33/yocto_wandboard:0.1'     
			    	echo 'Build Image Completed'
		    }
		}
		stage('Push Image') {
		    steps {
			    	echo 'Push the image'
		    }
		}
	}
	post{
		always {  
			sh 'docker logout'           
		}      
	} 
}
