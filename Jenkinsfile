pipeline {
  agent {
    docker { 
      image 'node:alpine3.14' 
      args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  environment {
        registry = "fedsatya/node-jenkins-image" // Define the Docker Hub account/repository
        registryCredential = 'docker-cred' // Specify the Jenkins credentials ID for Docker Hub
        dockerImage = '' // Variable to store the Docker image name
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
              dockerImage = docker.build registry + ":latest" // Build the Docker image with the specified tag
          }
      }
    }
    stage('Push Docker Image') {
      steps {
          script {
              docker.withRegistry('', registryCredential) {
                dockerImage.push() // Push the Docker image to the Docker Hub repository
              }
          }
      }
    } 
     
  }
}
