pipeline {
    agent any

    environment {
        IMAGE = "sathishbalaji03/prod:latest"
    }

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t react-app .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

                    docker tag react-app $IMAGE

                    docker push $IMAGE

                    docker logout
                    '''
                }
            }
        }

        stage('Deploy') {
    steps {
        sh '''
        docker rm -f react-app || true

        docker run -d \
          --name react-app \
          --restart always \
          -p 80:80 \
          react-app
        '''
            }
        }
    }
}