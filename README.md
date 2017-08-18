
```bash
docker pull chrisoei/squid
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
  chrisoei/squid
```

