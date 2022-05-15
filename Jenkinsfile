pipeline {
	agent any

	stages {
		stage('Build') {
			steps {
				sh "export NGINX_VERSION=nginx-1.20.2"
				sh "docker build --build-arg NGINX_VERSION=$NGINX_VERSION -t vlobachevsky/nginx-demo ."
			}
		}
		stage('Test') {
			steps {
				echo 'OK'
			}
		}
		stage('Deploy') {
			steps {
				echo 'OK'
			}

		}
	}
}