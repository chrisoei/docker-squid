all: build

build: Dockerfile entrypoint.sh Makefile squid.conf
	docker build --label build=`stardate` --tag=chrisoei/squid .

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

