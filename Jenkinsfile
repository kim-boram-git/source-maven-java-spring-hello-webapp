pipeline {
  agent none

  stages {

    stage('Checkout') {
      agent any
      steps {
        git branch: 'main',
            url : 'https://github.com/kim-boram-git/source-maven-java-spring-hello-webapp.git'
      }
    }

    stage('Build'){
      agent{
        docker {image 'maven:3-openjdk-17'}
      }
      steps{
        sh 'docker image build -t tomcat:hello .'
      }
    }

    stage('Image Tag'){
      agent any
      steps{
        sh 'docker image tag tomcat:hello boo77 /tomcat:$BUILD_NUMBER'
        sh 'docker image tag tomcat:hello boo77 /tomcat:latest'
      }
    }

    stage('Image Push'){
      agent any
      steps{
        withDockerRegistry(credentialsId: 'docker-hub-token',url: 'https://index.docker.io/v1/'){
          sh 'docker image push tomcat:hello boo77 /tomcat:$BUILD_NUMBER'
          sh 'docker image push tomcat:hello boo77 /tomcat:latest'
        }
      }
    }
  }
}
