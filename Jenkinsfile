pipeline {
    agent any

    stages {
        stage('SonarQube Analysis') {
            def scannerHome = tool 'SonarScanner';
            withSonarQubeEnv() {
                sh "${scannerHome}/bin/sonar-scanner"
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
