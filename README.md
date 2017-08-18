
```bash
docker pull chrisoei/docker-squid
```

The default cache size is only 100MB. I bumped it up to 100GB.

```bash
docker run \
  --name squid \
  -d \
  --rm \
  -p 3128:3128 \
  -v /var/log/squid:/var/log/squid \
  -v squid_cache:/var/spool/squid \
  chrisoei/docker-squid
```

```bash
alias use_proxy='export http_proxy=http://192.168.0.112:3128 && \
  export HTTP_PROXY="$http_proxy"'
```

