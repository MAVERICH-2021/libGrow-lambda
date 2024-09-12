# libGrow-lambda
all lambdas of liggrow written in Goland



# Build And Zip Go App for AWS Lambda
https://github.com/aws/aws-lambda-go

```bash
make build-zip
```

- [ ] next step: run make file in Ubuntu system
- [ ] add config parameter in lambda configuration

# How to deploy
To build for linux Runtime
 $env:GOOS = "linux"
 $env:CGO_ENABLED = "0"
 $env:GOARCH = "amd64"
 go build -o main main.go

 how to create go zip
https://docs.aws.amazon.com/lambda/latest/dg/golang-package.html

install go lambda in windows
go.exe install github.com/aws/aws-lambda-go/cmd/build-lambda-zip@latest
go lambda repo
go get github.com/aws/aws-lambda-go/lambda

 ~\Go\Bin\build-lambda-zip.exe -output main.zip main
C:\Users\wode1\go\bin\build-lambda-zip.exe -output main.zip main

aws lambda create-function --function-name myFunction \
--runtime provided.al2023 --handler bootstrap \
--architectures arm64 \
--role arn:aws:iam::111122223333:role/lambda-ex \
--zip-file fileb://myFunction.zip

aws lambda create-function --function-name hhh --runtime provided.al2 --handler handler --architectures x86_64 --role arn:aws:iam::607308589018:role/awsLambdaExcute --zip-file fileb://hello.zip
aws lambda update-function-code --function-name hhh --zip-file fileb://hello.zip

# how to config
go to config folder check config structure
Aws config env: