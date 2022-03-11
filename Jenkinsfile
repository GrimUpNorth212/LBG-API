pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t gcr.io/lbg-210222/api-graham:latest -t gcr.io/lbg-210222/api-graham:build-$BUILD_NUMBER .'
			}
		}
		stage('Push GCR'){
			steps{
            sh 'docker push gcr.io/lbg-210222/api-graham:build-$BUILD_NUMBER'
			sh 'docker push gcr.io/lbg-210222/api-graham:latest'
			}
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./kubernetes/nginx.yaml
            kubectl apply -f ./kubernetes/api-deployment.yml
                        kubectl rollout restart deployment/api
			'''
			}
		}
        stage('Cleanup'){
			steps{
            sh 'docker rmi gcr.io/lbg-210222/api-graham:latest'
			sh 'docker rmi gcr.io/lbg-210222/api-graham:build-$BUILD_NUMBER'
			}
		}
    }
}
