pipeline {
    agent none
    environment {
        // Define the JAVA_HOME environment variable
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk'
    }
    stages {
        stage('Set up Environment') {
            agent any
            steps {
                // Install JDK 17
                sh '''
                    apk add --no-cache openjdk17
                    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
                    export PATH=$PATH:$JAVA_HOME/bin
                '''
            }
        }
        stage('Maven Install') {
            agent {         
                docker {          
                    image 'maven:3.8.8'         
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
