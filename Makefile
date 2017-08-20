all: build

build: Dockerfile entrypoint.sh Makefile squid.conf .git/refs/heads/master
	docker build \
		--label build=`stardate` \
		--label commit_hash=`git rev-parse HEAD` \
		--tag=chrisoei/squid \
		.

push: build
	docker push chrisoei/squid

run: build
	docker run \
		--name squid \
		-d \
		--rm \
		-p 3128:3128 \
		-v /var/log/squid:/var/log/squid \
		-v squid_cache:/var/spool/squid \
		chrisoei/squid

