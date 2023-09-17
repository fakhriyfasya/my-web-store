pipeline {
    agent any

    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool name: 'SonarQube Scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    def scannerScript = sh (script: "cd \${WORKSPACE} && ${scannerHome}/bin/sonar-scanner.bat", returnStatus: true)
                    
                    if (scannerScript != 0) {
                        error('SonarQube scanner failed.')
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
