# aws-lambda-ruby-xray-demo
A demonstration lambda using aws-xray-sdk-ruby

This will deploy a single ruby function that calls `list_tables` on the DynamoDB service,
then retrieves `https://ip-ranges.amazonaws.com/ip-ranges.json` to demonstrate
the instrumentation of the `aws_sdk` and `net_http` libraries.

Note that this project uses [this fork](https://github.com/bonybrown/aws-xray-sdk-ruby/tree/lambda-instrumentation)
of the aws-xray-sdk-ruby gem.

## Deployment prerequisites

* docker
* aws cli tool
* an AWS S3 bucket

### Deployment

* run `./build.sh` to build the zip file containing the function and bundled gems.
* run `aws cloudformation package --template-file sam_template.yaml --s3-bucket $BUCKET_NAME > cf.yaml`, replacing $BUCKET_NAME with the name of a bucket you have access to.
* run `aws cloudformation deploy --template-file cf.yaml --stack-name 'aws-lambda-ruby-xray-demo' --capability CAPABILITY_IAM` to deploy the stack containing the function.

### Test

Log in the AWS Lambda console and create a test event (of any type). Click Test.

From the monitoring tab, you should be able to drill down the X-Ray traces created when the function executes.
