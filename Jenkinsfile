pipeline{
    agent any

    environment {
        DOCKER_IMAGE = 'shin'
        TAG = "${GIT_BRANCH.split("/")[1]}-${GIT_COMMIT.substring(0, 6)}-${BUILD_NUMBER}"
    }

    options {
        ansiColor('xterm')
    }


    parameters {
      choice(
          name: 'APP',
          choices: ['client', 'admin', 'mailer],
          description: 'Select App'
      )
    }


    stages{
        stage("Copy dockerfile and deploy file"){
            steps {
                cp "apps/shin_$PARAMS/Dockerfile" .
                cp "apps/shin_$PARAMS/deploy.sh" .
            }
        }
        stage("build image docker"){
            steps {
                echo '****** Build and tag image ******'

                script {
                    docker.build DOCKER_IMAGE + ":$TAG"
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
