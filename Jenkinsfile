pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-token2')
    }
    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv() {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t fakhriyfasya/my-web-store:$BUILD_NUMBER .'
                sh 'docker build -t fakhriyfasya/my-web-store:latest .'
                sh 'docker images'
            }
        }
        
        stage('Push Docker Image to Dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push fakhriyfasya/my-web-store:$BUILD_NUMBER'
                sh 'docker push fakhriyfasya/my-web-store:latest'
            }
        }
        
        stage('Test Docker Image') {
            steps {
                sh 'docker run -d --name my-web-store-$BUILD_NUMBER -p 8080:80 fakhriyfasya/my-web-store:latest'
                sh 'curl 34.128.125.45:8080'
                sh 'docker stop my-web-store-$BUILD_NUMBER'
                sh 'docker rm -f my-web-store-$BUILD_NUMBER'
                sh 'docker rmi -f fakhriyfasya/my-web-store:latest'
            }
        }
    }
    
//    post {
//        always {
//            sh 'docker logout'
//            echo 'docker logout'
        }
    }
}
