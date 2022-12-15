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
	// To upload artifacts into S3 bucket
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
	  //TO download war files from s3 bucket to tomcat 
	stage('deploy to tomcat from S3') {
	    steps {			
	        sh " aws s3 cp s3://new.bucket1/webapp/target/webapp.war  /opt/apache-tomcat-10.0.27/webapps"
	    }
	}
  }
	// To send email notification for pipeline status
	 post {
	      always {
		
		      emailext body: '$DEFAULT_CONTENT', //configure message in body in jenkins
		      subject: 'Jenkins Build Status', 
		      to: 'gopiperumalla14@gmail.com'
	 
		}
	  } 
}
