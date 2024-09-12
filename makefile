# if you use windows firstly add build-lambda-zip to path
build-zip-view:
	GOOS=linux GOARCH=86_64 go build -o bootstrap ./cmd/view/main.go
	#zip view-lambda-handler.zip bootstrap
	build-lambda-zip view-lambda-handler.zip bootstrap

build-zip-upload:
	GOOS=linux GOARCH=86_64 go build -o bootstrap ./cmd/upload/main.go
	#zip upload-lambda-handler.zip bootstrap
	build-lambda-zip upload-lambda-handler.zip bootstrap

build-zip-delete:
	GOOS=linux GOARCH=86_64 go build -o bootstrap ./cmd/delete/main.go
	#zip delete-lambda-handler.zip bootstrap
	build-lambda-zip delete-lambda-handler.zip bootstrap

build-zip: build-zip-view build-zip-upload build-zip-delete