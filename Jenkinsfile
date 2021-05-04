pipeline {
    agent any

    stages {
        stage('preperation') {
            steps {
                git 'https://github.com/ahmedmumdouh/Booster_CI_CD_Project.git'
            }
        }
        stage('CI') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'mypass', usernameVariable: 'myname')]) {
                    bat """
                    docker build . -t amamdouh/os_app:1.0
                    docker login --username ${myname} --password ${mypass}
                    docker push amamdouh/os_app:1.0
                    """
                }
            }
        }
        stage('CD') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'mypass', usernameVariable: 'myname')]) {
                    bat """
                    docker compose up
                    """
                }
            }
            post{
                success{
                    slackSend(color:"#66ffff", message:"Hi Mamdouh ...")
                }
            }
        }
       
    }
}
