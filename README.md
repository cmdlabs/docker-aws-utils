# docker-aws-utils

Docker image with `aws` and other useful utilities

## Why?

This image is used when following the [3 Musketeers] pattern. By running `aws` inside Docker, we ensure consistency, control and confidence.

  * Consistency: when developing automated processes that use `aws`, you can be sure that they will function the same whether you run it on your Windows workstation or on a Jenkins build agent.
  * Control: by specifying the version of the image in [docker-compose.yml][], we can deploy to two incompatible versions of awscli simultaneously.
  * Confidence: reliable deployments build confidence in the use of CI/CD pipelines, creating a positive feedback loop that encourages developers to use CI/CD

[3 Musketeers]: https://3musketeers.io/


## How To Use

Makefile:
```Makefile
deploy:
	docker-compose run --rm aws apply
```

docker-compose.yml:
```yaml
services:
  aws:
    image: cmdlabs/aws-utils:1.16.96
    volumes:
      - .:/opt/app:Z
```
