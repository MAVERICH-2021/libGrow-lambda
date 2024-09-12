@echo off
SETLOCAL EnableDelayedExpansion

:: Set environment variables for building Go
SET GOOS=linux
SET CGO_ENABLED=0
SET GOARCH=amd64

:: Folder where the cmd folder is located (assumes script is run from the root project folder)
SET ROOT_DIR=%~dp0

:: disable aws info page after uploading
SET AWS_PAGER=

:: Build and zip each function inside the cmd folder
FOR /D %%G IN ("%ROOT_DIR%cmd\*") DO (
    SET "FUNC_NAME=%%~nxG"

    ECHO Building function: !FUNC_NAME!

    :: Build the Go function inside each folder (output to the same folder)
    go build -o "%%G\!FUNC_NAME!" "%%G\main.go"

    :: Zip the build artifact in the same folder
    C:\Users\wode1\go\bin\build-lambda-zip.exe -output "%%G\!FUNC_NAME!.zip" "%%G\!FUNC_NAME!"

    :: Deploy the function to AWS Lambda, replacing the function name
    aws lambda create-function --function-name !FUNC_NAME! --runtime provided.al2 --handler !FUNC_NAME! --architectures x86_64 --role arn:aws:iam::607308589018:role/awsLambdaExcute --zip-file fileb://%%G\!FUNC_NAME!.zip
)

ECHO All functions built, zipped, and deployed!
pause
