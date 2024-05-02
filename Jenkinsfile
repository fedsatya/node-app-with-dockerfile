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
  }
}
