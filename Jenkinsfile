pipeline {

    agent any

    environment {

        IMAGE_DEV = "sathishbalaji03/dev:latest"
        IMAGE_PROD = "sathishbalaji03/prod:latest"

    }

    stages {

        stage('Checkout') {

            steps {

                git branch: "${env.BRANCH_NAME}",
                    url: 'https://github.com/Sathish-0-3/devops-build.git'

            }

        }

        stage('Build Image') {

            steps {

                sh 'docker build -t react-app .'

            }

        }

        stage('Push Dev') {

            when {

                branch 'dev'

            }

            steps {

                sh '''
                docker tag react-app $IMAGE_DEV
                docker push $IMAGE_DEV
                '''

            }

        }

        stage('Push Prod') {

            when {

                branch 'master'

            }

            steps {

                sh '''
                docker tag react-app $IMAGE_PROD
                docker push $IMAGE_PROD
                '''

            }

        }

        stage('Deploy') {

            steps {

                sh '''
                docker compose down
                docker compose up -d
                '''

            }

        }

    }

}