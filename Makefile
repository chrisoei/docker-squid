all: build.log

build.log: Dockerfile entrypoint.sh Makefile squid.conf .git/refs/heads/master
	docker build \
		--label build=`stardate` \
		--label commit_hash=`git rev-parse HEAD` \
		--tag=chrisoei/squid \
		. 2>&1 | tee build.log

push: build.log
	docker push chrisoei/squid

run: build.log
	docker run \
		--name squid \
		-d \
		--rm \
		-p 3128:3128 \
		-v /var/log/squid:/var/log/squid \
		-v squid_cache:/var/spool/squid \
		chrisoei/squid

shell: build.log
	docker run \
		--name squid \
		-it \
		--rm \
		-v /var/log/squid:/var/log/squid \
		-v squid_cache:/var/spool/squid \
		chrisoei/squid \
		/bin/bash

