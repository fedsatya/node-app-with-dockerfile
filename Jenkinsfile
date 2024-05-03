pipeline {
  agent {
    docker { 
      image 'node:alpine3.14' 
      args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {
    stage('Install') {
      steps {
        sh 'npm ci'
      }
    }
    stage('Lint') {
      steps {
        sh 'npx eslint .'
      }
    }
    stage('Build Docker Image') {
      steps {
          script {
              docker.build("fedsatya/node-jenkins-image") 
          }
      }
    }
    stage('Push Docker Image') {
      steps {
          script {
              docker.withRegistry('https://hub.docker.com/', 'docker-cred') {
                docker.image("fedsatya/node-jenkins-image).push()
              }
          }
      }
    } 
     
  }
}
