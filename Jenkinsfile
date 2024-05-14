pipeline {
    agent any

    tools {
        maven "local_maven"
    }

    stages {
//         stage("Build") {
//             steps {
//                     bat 'mvn clean package'
//             }
//             post {
//                 success {
//                     echo "Archiving the Artifacts"
//                     archiveArtifacts artifacts: '**/target/*.jar'
//                 }
//             }
//         }
//
//         stage("Test") {
//             steps {
//                 bat 'mvn test'
//             }
//             post {
//                 always {
//                     junit 'target/surefire-reports/*.xml' // Archive JUnit test reports (assuming default location)
//                 }
//             }
//         }

        stage("deploy") {
            steps {
                bat 'docker build -t drestsecurity .'
                bat 'docker run -d -p 3000:3000 drestsecurity'
            }
        }
    }
}
