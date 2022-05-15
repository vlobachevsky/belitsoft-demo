pipeline {
	agent any

	parameters {
		string(name: 'NGINX_VERSION', defaultValue: 'nginx-1.20.2', description: 'A nginx source package version to download, e.g. nginx-1.20.2')
	}

	stages {
		stage('Build') {
			steps {
				sh "docker build --build-arg NGINX_VERSION=${params.NGINX_VERSION} -t vlobachevsky/nginx-demo ."
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