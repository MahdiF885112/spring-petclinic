#!groovy
pipeline {
    agent none
   stages {     
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
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker tag shanem/spring-petclinic mahdi1702/dhspring-petclinic"
          sh "docker push mahdi1702/dhspring-petclinic"
        }
      }
    }
  }
}
