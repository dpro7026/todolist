pipeline {
    agent {
        docker { image 'ruby:2.5.3' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'ruby -v'
            }
        }
    }
}
