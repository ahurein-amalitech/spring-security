pipeline {
    agent any

    tools {
        maven "docker_maven"
        docker "docker_docker"
    }

    stages {
        stage("Build and Dockerize") {
            steps {
                    sh 'mvn clean package -Dmaven.test.skip'

                    sh 'docker build -t drestsecurity .'
            }
            post {
                success {
                    echo "Archiving the Artifacts"
                    archiveArtifacts artifacts: '**/target/*.jar'
                }
            }
        }

        stage("Run Docker Container") {
            steps {
                script {
                    sh 'docker run -d -p 8080:8080 drestsecurity'
                }
            }
        }
    }
}
