pipeline {
  agent {
    docker { 
      image 'node:alpine3.14' 
      args '-u root'
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
    stage('Build and Push Docker Image') {
        environment {
            DOCKERHUB_CREDENTIALS = credentials('docker-cred')
        }
        steps {
            script {
                docker.withRegistry('https://registry.hub.docker.com', "docker-cred") {
                    // Build the Docker image from the Dockerfile in the root directory
                    sh 'docker build -t fedsatya/node-docker-jenkins .'
                    // Push the image to your DockerHub repository
                    sh 'docker push fedsatya/node-docker-jenkins'
                }
            }
        }
     }
  }
}
