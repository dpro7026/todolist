pipeline {
    agent {
        docker { image 'ruby:2.5.1' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'ruby -v'
            }
        }
    }
}
