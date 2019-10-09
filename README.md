# node-js-deploy

Node js application with an additional static page /colors.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

1. AWS account with user having access to EB service.
2. [EB CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html) available from where the script will be run.

### Installing

A step by step series of examples that tell you how to get a development env running

Clone repository to get the script

```
git clone https://github.com/anukanksha13/node-js-deploy.git
```

Run script by passing required parameters.

```
sh deploy-app.sh --aws-user-profile=user1 --aws-region=us-east-2
```

## Running the tests

Access the application using domain name created as part of deployment.
