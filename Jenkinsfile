pipeline {
    agent any
    environment {
        ECR_REGISTRY = "021189335138.dkr.ecr.us-east-1.amazonaws.com"
        APP_REPO_NAME= "golf/to-do-app"
    }
    stages {
        stage('Ecr repository create') {
            steps {
                sh 'aws ecr create-repository \
    --repository-name $APP_REPO_NAME \
    --image-scanning-configuration scanOnPush=false \
    --image-tag-mutability IMMUTABLE \
    --region us-east-1 || true'
               
            }
        }
        stage('Build Docker Image') {
            steps {
                sh """cd student_files/nodejs  
                docker build --force-rm -t "$ECR_REGISTRY/$APP_REPO_NAME/nodejs:latest" .
                docker image ls
                """
            }
        }
        stage('Push Image to ECR Repo') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "$ECR_REGISTRY"'
                sh 'docker push "$ECR_REGISTRY/$APP_REPO_NAME/nodejs:latest"'
            }
        }
        stage('wait') {
            steps {
                sh 'sleep 180'
            }
        }
    }
    post {
        always {
            echo 'Deleting all local images'
            sh 'docker image prune -af'
        }
    }
}