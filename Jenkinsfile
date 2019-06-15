pipeline{
    agent {
        docker {
            image "ruby:alpine"
        }
    }
    stages{
        stage("Build"){
            steps{
                sh "chmod +x build/alpine.sh"
                sh "./build/alpine.sh"
                sh "sudo apt-get bundle install"
            }
        }
        stage("Tests"){
            steps{
                sh "bundle exec cucumber -p ci"
            }
        }
    }
}