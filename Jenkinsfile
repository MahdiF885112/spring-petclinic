pipeline {
    agent any
    environment {
        // Define the JAVA_HOME environment variable
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk'
    }
    stages {
        stage('Set up Environment') {
            steps {
                script {
                    // Download and install JDK 17
                    sh '''
                        wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
                        tar xzf openjdk-17_linux-x64_bin.tar.gz -C /usr/lib/jvm/
                        rm openjdk-17_linux-x64_bin.tar.gz
                        export JAVA_HOME=/usr/lib/jvm/jdk-17
                        export PATH=$PATH:$JAVA_HOME/bin
                    '''
                }
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

