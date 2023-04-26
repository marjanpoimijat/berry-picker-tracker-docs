# AWS Deployment

The story so far

- Lambda with RDS was chosen
- Using Docker container in lambda, because it was already used in the project and it makes dependency handling easy
- Container uploaded to amazon Elastic Container Registry (ECR)
- Lambda function uses the image from ECR
- Database used was a AWS Relational Database Service (RDS) Postgres instance
- The RDS database address is provided as an environment variable to lambda in the functions settings.
- Connection between Lambda and RDS database should work if neither of the two are in Virtual Private Clouds (VPC) or if both are in the same VPC.
- If the lambda function is in a VPC, it cannot connect to the internet freely, which means it cannot get map tiles from the public APIs used.

Guide for setting it up the way we had it set up

The Docker image and uploading it
 - The docker image for Lambda is generated with [this Dockerfile](https://github.com/marjanpoimijat/berry-picker-tracker-server/blob/main/docker/prod/Dockerfile)
 - Use [AWS CLI](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html) (or [the Github Actions workflow](https://github.com/marjanpoimijat/berry-picker-tracker-server/blob/main/.github/workflows/lambda.yaml)) to push it to ECR 
 - Note that Lambda needs to use the [Mangum](https://mangum.io/) handler

Setting up the Lambda function and RDS database should be pretty straightforward.

First, create the VPC, a database subnet, 2 security groups, and subnets as required. More in the Networking section.

Create the RDS database according to the instructions on the page. Make sure to select free tier.

Creating the Lambda function should be straightforward as well.

Test the Lambda function with the test events feature in Lambda, or by using it with the app. Test that the database and maps work.

## Networking

[AWS network basics](https://coady.tech/aws-101-networking/)
The project should be in a VPC, with security groups making sure that the database can only be accessed by the Lambda function. The Database security group only accepts connections from the 
The current problem with this project is that we want to have our resources in a VPC to keep them secure, but also have our Lambda function get us maps and connect to the database. To allow our Lambda function access to the outside internet we would need to use a NAT Gateway, which is a bit costly. Because of this and other issues concerning maptile APIs, the deployment was put on hold to reassess the options for serving map tiles. 
