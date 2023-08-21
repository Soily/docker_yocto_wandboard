pipeline {
    environment {
        registry = "crymeariver33/yocto_wandboard"
        registryCredential = 'docker-hub-credentials'
    }
    agent { any }
    stages {
        stage('Initialize'){
            steps {
                script {
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }
        stage('Test Docker Image Environment') {
            steps {
                sh 'echo TITTEN =$TITTEN'
            }
        }
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
            }
        }
    }
}
