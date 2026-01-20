pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps {
        git branch: 'main',
            url: 'https://github.com/kim-boram-git/source-maven-java-spring-hello-webapp.git'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker image build -t tomcat:hello .'
      }
    }

    stage('Image Tag') {
      steps {
        sh 'docker image tag tomcat:hello boo77/tomcat:${BUILD_NUMBER}'
        sh 'docker image tag tomcat:hello boo77/tomcat:latest'
      }
    }

    stage('Image Push') {
      steps {
        withDockerRegistry(
          credentialsId: 'docker-hub-token',
          url: 'https://index.docker.io/v1/'
        ) {
          sh 'docker image push boo77/tomcat:${BUILD_NUMBER}'
          sh 'docker image push boo77/tomcat:latest'
        }
      }
    }
  }
}

