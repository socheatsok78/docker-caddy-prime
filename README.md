<a href="https://caddyserver.com/">
    <img src="https://caddyserver.com/resources/images/logo-dark.svg" alt="Caddy" height="86px">
</a><br /><br />

A customized Caddy tailored for [@socheatsok78](https://github.com/socheatsok78), built with the following modules:

- [caddy.storage.rqlite](https://github.com/socheatsok78/caddy-storage-rqlite)
- [dns.providers.acmeproxy](https://github.com/caddy-dns/acmeproxy)
- [dns.providers.cloudflare](https://github.com/caddy-dns/cloudflare)
- [http.ip_sources.list](https://github.com/monobilisim/caddy-ip-list)
- [http.ip_sources.cloudflare](https://github.com/WeidiDeng/caddy-cloudflare-ip)
- [tls.issuance.cloudflare_origin_ca](https://github.com/rjevski/caddy-cloudflare-origin-ca)

To use this image, simply pull it from the GitHub Container Registry and use it as your base image in your Dockerfile:

```Dockerfile
ARG CADDY_VERSION
FROM ghcr.io/socheatsok78/caddy-prime:${CADDY_VERSION}
```

[Source](https://caddyserver.com/) | [GitHub Container Registry](https://github.com/users/socheatsok78/packages/container/package/caddy-prime)

## License
This project is licensed under the [BSD-2-Clause](LICENSE) license. See the LICENSE file for details.
