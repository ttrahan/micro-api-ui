# micro-api demo application

This is the back-end of a simple 2-tier app to demonstrate deploying [Docker]
(www.docker.com)-based application on [AWS Elastic Beanstalk]
(aws.amazon.com/elasticbeanstalk) through Shippable. To see the full functionality
of the app, use the same steps to deploy the front-end of the app which is also
on Aye0Aye called [micro-www](https://github.com/aye0aye/micro-www).

When this sample repo is enabled in Shippable, the CI process performs the following:
* Uses Docker to build the CI environment from a Dockerfile, pulling the base
image from public Docker Hub repository "aye0aye/micro-image"
* Executes some basic CI tests
* Stores the test results and code coverage report
* Upon successful CI build:
  * Pushes the newly built Docker image to Docker Hub repository "aye0aye/micro-api"
  * Deploys the new image to an Elastic Beanstalk application

# Optional environment variables required for application:
- API_PORT: Port used for app (default:80)
- LOG_LEVEL: Specifies log level for Winston console (silly, debug, verbose, info, warn, error).
This microservice uses info and error messages only.
- SHUD_LOG_TO_FILE: true or false, specifies whether to save logs to logs.log

# Environment variables required for deploying to Elastic Beanstalk
Before beginning, create a new application and environment in Elastic Beanstalk
using [the instructions available here](https://aws.amazon.com/elasticbeanstalk/getting-started/).

In the shippable.yml, change the following values, as needed, based on your EB application.
Note that these are optional as env variables and can be put in directly within the
commands, as appropriate:
- AWS_EB_APPLICATION:_yourElasticBeanstalkApplicationName_
- AWS_EB_ENVIRONMENT=_yourElasticBeanstalkEnvironmentName_
- REGISTRY_ACCOUNT=_yourDockerRegistryAccount_  
  * Note that this can be the account/registry URL for any valid Docker Registry
- ACCOUNT_IDENTIFIER=shippable.$REGISTRY_ACCOUNT
  * No changes needed
