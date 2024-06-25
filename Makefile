tag ?= latest
image = rafaelbmateus/docker-pg-dump:$(tag)

build:
	docker build -t $(image) .

run: build
	docker rm -f docker-pg-dump;
	docker run -d \
		--name docker-pg-dump \
		--env-file .env \
		-v $(PWD)/postgres:/var/lib/postgresql/data \
		-v $(PWD)/dumps:/dumps \
		$(image)

check: run
	sleep 1
	docker exec \
		docker-pg-dump \
		check.sh

dump: run
	sleep 1
	docker exec -ti \
		docker-pg-dump \
		dump.sh

run-daily: run
	sleep 1
	docker exec -ti \
		docker-pg-dump \
		run-daily

bash: run
	docker exec -ti \
		docker-pg-dump \
		/bin/bash

push: build
	docker image push $(image)
