package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

// The handler function must accept two parameters: event and context
func handler() (string, error) {
	// Output message
	fmt.Println("Hello Lambda from Go")

	// Return a response and nil for no error
	return "Hello Lambda from Go", nil
}

func main() {
	// Register the handler function with the Lambda runtime
	lambda.Start(handler)
}

//To build for linux
// $env:GOOS = "linux"
// $env:CGO_ENABLED = "0"
// $env:GOARCH = "amd64"
// go build -o main main.go

// how to create go zip
///https://docs.aws.amazon.com/lambda/latest/dg/golang-package.html

// install go lambda in windows
//go.exe install github.com/aws/aws-lambda-go/cmd/build-lambda-zip@latest
// go lambda

//go get github.com/aws/aws-lambda-go/lambda

// ~\Go\Bin\build-lambda-zip.exe -output main.zip main

///aws lambda create-function --function-name myFunction \
//--runtime provided.al2023 --handler bootstrap \
//--architectures arm64 \
//--role arn:aws:iam::111122223333:role/lambda-ex \
//--zip-file fileb://myFunction.zip

//aws lambda create-function --function-name hhh --runtime provided.al2 --handler handler --architectures x86_64 --role arn:aws:iam::607308589018:role/awsLambdaExcute --zip-file fileb://hello.zip
