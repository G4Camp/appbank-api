node('master') {
    stage ('Checkout') {
        checkout scm
    }
    stage ('Build') {
        sh "docker build --build-arg SERVER_PORT=${SERVER_PORT} -t appbank/api:B${BUILD_NUMBER} -f Dockerfile ."
    }
    stage ('Deployment') {
        try {
            sh "docker stop appbank_api"
            sh "docker rm appbank_api"
        } catch (Exception e) {
            sh "echo 'container not running'"
        }
        sh "docker run -d -e PORT=${SERVER_PORT} -p ${SERVER_PORT}:${SERVER_PORT} --name appbank_api appbank/api:B${BUILD_NUMBER}"
        
    }
}
