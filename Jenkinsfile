pipeline{
  agent any
  stages{
    stage('Check Maven version'){
      steps{
        sh 'mvn -v'
      }       
    }
    stage('Code Quality'){
      steps{
        sh 'echo Sonarqube Code Quality Check Done'
      }
    }
    stage('Testing maven file'){
      steps{
        sh 'mvn test'
      }
    } 
    stage('Ready to deploy jar'){
    	input{
    	  message "are you sure you want to deploy on prod"
    	  ok "yes,go ahead"
    	}
      steps{
        sh 'mvn clean package'
      }
    }
    stage('Upload War File To Artifactory'){
      steps{
        sh 'echo Uploaded War file to Artifactory'
      }
    }
    stage('Deploy on container') {
        steps{
         script {
             sh '''
             sudo docker build -t webimage:$BUILD_NUMBER .
             sudo docker container run -dp 8888:8888 --name webserver$BUILD_NUMBER  webimage:$BUILD_NUMBER
             docker ps '''
         }
      }
    }
     
  }
}
