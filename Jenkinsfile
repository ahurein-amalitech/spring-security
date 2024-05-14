pipeline {
    agent any

    tools {
        maven "local_maven"
    }

    stages {
        stage("Build") {
            steps {
                    bat 'mvn clean package'
            }
        }

        stage("Test") {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage("deploy") {
                bat "docker-compose -f Docker-compose.yml down"
                bat "docker-compose -f Docker-compose.yml build"
                bat "docker-compose -f Docker-compose.yml up -d"
            }
        }
    }
}
