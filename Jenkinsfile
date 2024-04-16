pipeline {
    agent none
    stages {
        stage('Set up Environment') {
            agent any
            steps {
                // Install JDK 17 using the 'tool' directive
                tool 'jdk-17'
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
