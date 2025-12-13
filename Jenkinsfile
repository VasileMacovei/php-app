pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
                sh '''
                    docker build -t php-app-test .
                    docker run --rm php-app-test vendor/bin/phpunit tests
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t php-app:latest .'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh '''
                    docker stop php-app || true
                    docker rm php-app || true
                    docker run -d --name php-app -p 8081:8081 php-app:latest
                '''
            }
        }
    }
}
