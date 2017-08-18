all: build

build:
	docker build --label build=`stardate` --tag=chrisoei/squid .
	docker push chrisoei/squid
