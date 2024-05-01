pipeline {
  agent {
    docker { image 'node:alpine' }
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
