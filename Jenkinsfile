pipeline {
    agent any

    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv(credentialsId: 'sonar-server') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Hello World !'
            }
        }
        stage('Docker Push to Dockerhub') {
            steps {
                echo 'Hello World !'
            }
        }
    }
}
