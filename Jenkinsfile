pipeline {
	agent any

	options {
		buildDiscarder(logRotator(numToKeepStr: '10'))
	}

	parameters {
		string(name: 'NGINX_VERSION', defaultValue: 'nginx-1.20.2', description: 'A nginx source package version to download, e.g. nginx-1.20.2')
	}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-vlobachevsky')
	}

	stages {
		stage('Build') {
			steps {
				sh "docker build --build-arg NGINX_VERSION=${params.NGINX_VERSION} -t vlobachevsky/nginx-demo ."
				sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
				sh "docker push vlobachevsky/nginx-demo"
			}
		}
		stage('Test') {
			steps {
				sh "docker run -d --name nginx-demo -p 8081:80 vlobachevsky/nginx-demo"
				sleep 10
				sh "curl -I http://localhost:8081"
			}
			post {
				cleanup {
					sh "docker container stop nginx-demo"
					sh "docker container rm nginx-demo"
				}
			}
		}
		stage('Deploy') {
            steps {
                withKubeConfig([credentialsId: 'kubernetes-jenkins-token', serverUrl: 'http://localhost:8001']) {
                    sh "/usr/local/bin/kubectl apply -f k8s/nginx-demo-deployment.yaml"
                    sh "/usr/local/bin/kubectl apply -f k8s/nginx-demo-service.yaml"
                    sleep 20
                    sh "/usr/local/bin/kubectl get all"
                }
            }
		}
	}

	post {
		always {
			sh "docker logout"
		}
	}
}