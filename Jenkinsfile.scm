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
        stage('npm install'){
            steps {
                echo 'install'
                 dir('my-app'){
                    bat 'npm install'
                 }
            }
        }
        stage('npm build'){
            steps {
                echo 'buildteset'
                 dir('my-app'){
                    bat 'npm run build'
                 }
            }
        }
        staget('before build remove'){
            steps{
                echo '이전 빌드 삭제 프로세스'
                dir('my-app'){
                     echo '이전 빌드 삭제 프로세스'
                }
            }
        }
        stage('send buildFile'){
            steps{
                echo 'send builFile jenkins -> targetServer'
                dir('my-app'){
                    bat 'scp -r build EaBell@192.168.10.173:~/temp'
                }
            }
        }
    }
}