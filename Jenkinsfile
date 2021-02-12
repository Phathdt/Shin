pipeline{
    agent any

    environment {
        DOCKER_IMAGE = 'shin-'
        TAG = "${GIT_BRANCH.split("/")[1]}-${GIT_COMMIT.substring(0, 6)}-${BUILD_NUMBER}"
    }

    options {
        ansiColor('xterm')
    }


    parameters {
      choice(name: 'APP', choices: ['client', 'admin', 'worker'], description: 'Select App')
    }


    stages{
        stage("Copy files"){
            steps {
                sh './copy_files.sh'
            }
        }

        stage("build image docker"){
            steps {
                echo '****** Build and tag image ******'

                script {
                    docker.build DOCKER_IMAGE + "$APP" + ":$TAG"
                }
            }
        }

        stage("Deploy image docker"){
            steps {
                echo '****** Deploy image ******'

                sh './deploy.sh'
            }
        }
    }
}
