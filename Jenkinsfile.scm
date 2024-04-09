pipeline {
    agent any
    stages {
        stage('GitHub Repository Clone') {
            steps {
                git branch: 'main',
                    credentialsId: 'rayful',
                    url: 'https://github.com/Ea-Bell/testGItJenkinsTest.git'
            }
        }
        stage('build'){
            steps {
                sh 
                '''
                    echo build Test
                '''
                // npm run build
            }
        }
    }
}