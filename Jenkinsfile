pipeline {
    agent any

    tools {
        maven "docker_maven"
    }

    stages {
        stage ("Build"){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo "Archiving the Artifacts"
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ("Deploy"){
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat-local', path: '', url: 'http://192.168.3.32:5050/')], contextPath: null, war: '**/*.war'
            }
        }
    }
}