pipeline {
    agent any

    environment {
        DEV_IMAGE = "sathishbalaji03/dev:latest"
        PROD_IMAGE = "sathishbalaji03/prod:latest"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app .'
            }
        }

        stage('Push Dev Image') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

                    docker tag react-app $DEV_IMAGE
                    docker push $DEV_IMAGE

                    docker logout
                    '''
                }
            }
        }

        stage('Push Prod Image') {
            when {
                branch 'master'
            }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

                    docker tag react-app $PROD_IMAGE
                    docker push $PROD_IMAGE

                    docker logout
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop react-app || true
                docker rm react-app || true

                if [ "$BRANCH_NAME" = "master" ]; then
                    docker run -d --name react-app -p 80:80 $PROD_IMAGE
                else
                    docker run -d --name react-app -p 80:80 $DEV_IMAGE
                fi
                '''
            }
        }
    }

    post {
        success {
            echo "Build, Push and Deployment Successful."
        }

        failure {
            echo "Pipeline Failed."
        }
    }
}