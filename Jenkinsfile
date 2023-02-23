pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }

    stages {
        stage('Init') {
            steps {
                echo 'Initializing Terraform...'
                sh 'ls'
                sh 'pwd'
                sh 'terraform init'
            }
        }
    }

    stages {
        stage('Plan/Validate') {
            steps {
                echo 'Planning and Validating...'
                sh 'terraform plan && terraform validate'
            }
        }
    }

    stages {
        stage('Apply/Deploy') {
            steps {
                echo 'Applying/Deploying...'
                sh 'terraform apply -auto-approve'
            }
        }
    }
    
}