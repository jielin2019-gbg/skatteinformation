pipeline {
  agent any
  stages {
    stage('Account') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/account'
        }
      }
    }
    stage('Content') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/Content'
        }
      }
    }
    stage('QA') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/QA'
        }
      }
    }
    stage('Search') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/Search'
        }
      }
    }
    stage('Navigation') {
      steps {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
          sh 'robot -d results --variable BROWSER:headlesschrome ./tests/navigation'
        }
      }
    }
  }
}
