node {
        stage("Main build") {

            checkout scm

            docker.image('ruby:2.5.1').inside {

              stage("Install Bundler") {
                sh "gem install bundler --no-rdoc --no-ri"
              }

              stage("Use Bundler to install dependencies") {
                sh "bundle install"
              }

              stage("Build package") {
                sh "bundle exec rake build:deb"
              }

              stage("Archive package") {
                archive (includes: 'pkg/*.deb')
              }

           }

        }

        // Clean up workspace
        step([$class: 'WsCleanup'])

}
