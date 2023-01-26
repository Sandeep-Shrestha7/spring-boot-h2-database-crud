node {
        //cleanup current user docker credentials
        sh 'rm  ~/.dockercfg || true'
        sh 'rm ~/.docker/config.json || true'

        //configure registry
        docker.withRegistry('https://public.ecr.aws/v0i8s2l5/tutorial-demo', 'ecr:us-east-1:aws-credential') {

            //build image
            def customImage = docker.build("tutorial-demo:${env.BUILD_ID}")

            //push image
            customImage.push()
        }
}