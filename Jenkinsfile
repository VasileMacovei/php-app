pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
                sh 'composer install'
                sh 'vendor/bin/phpunit --testdox'
            }
        }

        stage('Docker Build') {
            when {
                branch 'main'
            }
            steps {
                sh 'docker build -t php-app:latest .'
            }
        }

        stage('Docker Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    docker stop php-app || true
                    docker rm php-app || true
                    docker run -d --name php-app -p 8081:80 php-app:latest
                '''
            }
        }
    }
}
