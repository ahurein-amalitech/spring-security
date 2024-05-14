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
            post {
                success {
                    echo "Archiving the Artifacts"
                    archiveArtifacts artifacts: '**/target/*.jar'
                }
            }
        }

        stage("Test") {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' // Archive JUnit test reports (assuming default location)
                }
            }
        }

        stage("deploy") {
            steps {
                bat "docker-compose -f Docker-compose.yml down"
                bat "docker-compose -f Docker-compose.yml build"
                bat "docker-compose -f Docker-compose.yml up -d"
            }
        }
    }
}
