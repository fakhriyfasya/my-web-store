pipeline {
    agent {label "docker"}
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-token')
    }
    
    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv(credentialsId: 'sonar-token') {
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
                sh 'docker run -d --name my-web-store -p 8083:80 fakhriyfasya/my-web-store:$BUILD_NUMBER'
                sh 'docker run -d --name my-web-store -p 8084:80 fakhriyfasya/my-web-store:latest'
                sh 'curl 192.168.223.13:8083'
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
}
