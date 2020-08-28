pipeline {
  agent any
  stages {
    stage('QA') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/QA'
        }
      }
    }
  }
}
