all: build

build:
	docker build --label build=`stardate` --tag=chrisoei/squid .

push:
	docker push chrisoei/squid

run:
	docker run \
		--name squid \
		-d \
		--rm \
		-p 3128:3128 \
		-v /var/log/squid:/var/log/squid \
		-v squid_cache:/var/spool/squid \
		chrisoei/squid

