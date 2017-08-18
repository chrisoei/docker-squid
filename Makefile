all: build

build:
	docker build --tag=chrisoei/squid .
	docker push chrisoei/squid
