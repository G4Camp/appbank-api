node('master') {
    stage ('Checkout') {
        checkout scm
    }
    stage ('Build') {
        sh "docker build --build-arg SERVER_PORT=${SERVER_PORT} -m 3g -t appbank_api:B${BUILD_NUMBER} -f Dockerfile.prod ."
    }
    stage ('Deployment') {
        try {
            sh "docker stop appbank_api"
            sh "docker rm appbank_api"
        } catch (Exception e) {
            sh "echo 'container not running'"
        }
        sh "docker run -d  -p ${SERVER_PORT}:${SERVER_PORT} --name appbank_api appbank_api:B${BUILD_NUMBER}"
        
    }
}
