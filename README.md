# node-js-deploy

Node js application with an additional static page /colors.

## Getting Started

These instructions will get you an application running on AWS instance using Elastic Beanstalk.

### Prerequisites

1. AWS account with user having access to EB service.
2. [EB CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html) available from where the script will be run.

### Installing

Clone repository to get the deployment script.

```
git clone https://github.com/anukanksha13/node-js-deploy.git
```

Run script by passing required parameters.

```
sh deploy-app.sh --aws-user-profile=user1 --aws-region=us-east-2
```

Use --help option to check usage of the script.

```
sh deploy-app.sh --help
```

## Running the tests

Access the application using domain name created as part of deployment from Elastic Beanstalk.
