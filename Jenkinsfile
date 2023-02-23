pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }

    stages {
        
        stage('Init') {
            steps {
                dir('deploy_bucket'){
                    withCredentials([
                        string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                        string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')
                    ]){
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=$access_key']){
                            echo 'Initializing Terraform...'
                            sh '$KEY_ID'
                            sh 'ls'
                            sh 'pwd'
                            sh 'terraform init'
                        }
                    }
                }
                
            }
        }

    
        stage('Plan/Validate') {
            steps {
                dir('deploy_bucket'){
                    withCredentials([
                        string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                        string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')
                    ]){
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=$access_key']){
                            echo 'Planning and Validating...'
                            sh 'terraform plan && terraform validate'
                        }
                    }
                }
                
            }
        }
    
    
        stage('Apply/Deploy') {
            steps {
                dir('deploy_bucket'){
                    withCredentials([
                        string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                        string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')
                    ]){
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=$access_key']){
                            echo 'Applying/Deploying...'
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
    }
    
}