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
        
        stage('Build') {
            steps {
                echo 'Hello World !'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Hello World !'
            }
        }
    }
}
