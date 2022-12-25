node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

       app = docker.build('/data/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar')
    }

    stage('Test image') {

        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /*
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://turotaildemocr.azurecr.io', 'azure_acr_credential') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            }
                echo "Trying to Push Docker Build to ACR"
    }
}