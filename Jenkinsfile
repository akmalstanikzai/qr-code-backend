pipeline {
    agent any

    environment {
        ENV_FILE = "/var/lib/jenkins/env/backend.env"
        CONTAINER_NAME = "qr-backend"
        IMAGE_NAME = "qr-backend"
        PORT = "5000"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:akmalstanikzai/qr-code-backend.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
                    docker stop ${CONTAINER_NAME}
                    docker rm ${CONTAINER_NAME}
                fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d \
                  --name ${CONTAINER_NAME} \
                  -p ${PORT}:${PORT} \
                  --env-file ${ENV_FILE} \
                  ${IMAGE_NAME}
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! 🎉'
        }
        failure {
            echo 'Deployment failed ❌'
        }
    }
}
