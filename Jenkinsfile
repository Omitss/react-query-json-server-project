pipeline {

    agent any

    stages {

        stage('Git Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Omitss/react-query-json-server-project.git'
            }
        }

        stage('Check Environment') {
            steps {
                sh 'node -v'
                sh 'npm -v'
                sh 'docker --version'
                sh 'docker compose version'
            }
        }

        stage('React Build Test') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Docker Compose Build') {
            steps {
                sh 'docker compose build --no-cache'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh 'docker compose down || true'
                sh 'docker compose up -d'
            }
        }

        stage('Container Check') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {

        success {
            echo '================================'
            echo ' React + Json Server 배포 성공 '
            echo '================================'
        }

        failure {
            echo '================================'
            echo ' React + Json Server 배포 실패 '
            echo '================================'
        }

        always {
            cleanWs()
        }
    }
}