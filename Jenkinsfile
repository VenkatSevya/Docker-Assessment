pipeline {
  agent any

  tools {
    // Install the Maven version configured as "M2_HOME" and add it to the path.
    maven "mavenp"
  }

  stages {
  
	stage('Clone') {
      steps {
        // Get some code from a GitHub repository
	 git branch: "main", url: "https://github.com/VenkatSevya/Docker-Assessment.git"
		
		}
	}
	stage('Compile') {
	     steps {
	         sh "mvn clean package"
	     }
	}
	stage('Test') {
	    steps {
	        sh "mvn clean verify -DskipITs=true',junit '**/target/surefire-reports/TEST-*.xml'archive 'target/*.jar"

	    }
	}
	stage('SonarQube analysis') {
        steps{
        withSonarQubeEnv('Sonarqube') {
        sh "mvn sonar:sonar"
    		}
            }
        }
	 stage('S3 Upload') {
      steps {
        s3Upload consoleLogLevel: 'INFO',
	dontSetBuildResultOnFailure: false,
	dontWaitForConcurrentBuildCompletion: false,
	entries: [
				[
					bucket: 'new.bucket1', 
					excludedFile: '/webapp/target',
					flatten: false,
					gzipFiles: false,
					keepForever: false,
					managedArtifacts: false,
					noUploadOnFailure: false,
					selectedRegion: 'ap-south-1',
					showDirectlyInBrowser: false,
					sourceFile: '**/webapp/target/*.war',
					storageClass: 'STANDARD',
					uploadFromSlave: false,
					useServerSideEncryption: false
				]
			], 
	pluginFailureResultConstraint: 'FAILURE', 
	profileName: 'new.bucket1',
	userMetadata: []

      }
    }
    
    stage('Publish ECR') {
      steps {
        //withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) 
	script {
          sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 586583118654.dkr.ecr.ap-south-1.amazonaws.com'
          sh 'docker build -t docker.repo .'
          sh 'docker tag docker.repo:latest 586583118654.dkr.ecr.ap-south-1.amazonaws.com/docker.repo:latest'
          sh 'docker push 586583118654.dkr.ecr.ap-south-1.amazonaws.com/docker.repo:latest' 
	}
      } 
    }
	  stage('Running Docker Container') {
		  steps {
			  script {
				sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 586583118654.dkr.ecr.ap-south-1.amazonaws.com'
				sh "sudo docker rm -f webapp || true"   
				sh "docker pull 586583118654.dkr.ecr.ap-south-1.amazonaws.com/docker.repo:latest "
				sh "docker tag 586583118654.dkr.ecr.ap-south-1.amazonaws.com/docker.repo:latest webapp "
				sh "docker rmi 586583118654.dkr.ecr.ap-south-1.amazonaws.com/docker.repo:latest "
				sh "docker run --name webapp -itd -p 8002:8080 webapp"
				  
			  }
		  }
	  }
  }	
	post {
	        always {
		
		        emailext body: '$DEFAULT_CONTENT', //configure message in body in jenkins
		        subject: 'Jenkins Build Status', 
		        to: 'gopiperumalla14@gmail.com'
   		} 
	}
}	  
