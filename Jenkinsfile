pipeline {
    agent none
    environment {
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk'
    }
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.8.8'
                    // Mount Java 17 home directory into Maven Docker container
                    args '-v /usr/lib/jvm/java-17-openjdk:/usr/lib/jvm/java-17-openjdk'
                }
            }
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker build -t shanem/spring-petclinic:latest .'
            }
        }
    }
}
