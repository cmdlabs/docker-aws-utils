AWSCLI_VERSION = 1.16.96
IMAGE_NAME ?= cmdlabs/aws-utils:$(AWSCLI_VERSION)

dockerBuild:
	docker build -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app:Z -w /opt/app $(IMAGE_NAME) sh

tag:
	-git tag -d $(AWSCLI_VERSION)
	-git push origin :refs/tags/$(AWSCLI_VERSION)
	git tag $(AWSCLI_VERSION)
	git push origin $(AWSCLI_VERSION)

