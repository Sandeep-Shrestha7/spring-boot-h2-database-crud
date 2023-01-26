node {
  stage 'Checkout'
  git 'ssh://github.com/Sandeep-Shrestha7/spring-boot-h2-database-crud.git'

  stage 'Docker build'
  docker.build('demo')

  stage 'Docker push'
  docker.withRegistry('https://public.ecr.aws/v0i8s2l5/tutorial-demo', 'ecr:us-east-1:aws-credential') {
    docker.image('demo').push('latest')
  }
}