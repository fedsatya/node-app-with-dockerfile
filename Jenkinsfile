pipeline {
  agent {
    docker { image 'node:alpine3.14' }
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
