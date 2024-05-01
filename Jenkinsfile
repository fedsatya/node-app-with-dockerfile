pipeline {
  agent {
    docker { image 'node:alpine3.14' }
  }
  stages {
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Lint') {
      steps {
        sh 'npx eslint .'
      }
    }
  }
}
