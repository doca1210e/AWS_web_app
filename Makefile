# Define variables
IMAGE_NAME=fastapi-web-app
S3_BUCKET_NAME=dositejcvetkovicdemobucket
DOCKER_TAG=latest
AWS_REGION=eu-north-1

all: build

build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME):$(DOCKER_TAG) .

package:
	@echo "Packaging the app into a tarball..."
	tar -czf web-app.tar.gz --exclude=venv --exclude=.git --exclude=*.tar.gz *

upload:
	@echo "Uploading artifact to S3..."
	aws s3 cp web-app.tar.gz s3://$(S3_BUCKET_NAME)/web-app.tar.gz --region $(AWS_REGION)

clean:
	@echo "Cleaning up..."
	rm -f web-app.tar.gz