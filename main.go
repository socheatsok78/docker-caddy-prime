package main

import (
	caddycmd "github.com/caddyserver/caddy/v2/cmd"

	// plug in Caddy modules here
	_ "github.com/WeidiDeng/caddy-cloudflare-ip"
	_ "github.com/caddy-dns/acmeproxy"
	_ "github.com/caddy-dns/cloudflare"
	_ "github.com/caddyserver/caddy/v2/modules/standard"
	_ "github.com/monobilisim/caddy-ip-list"
	_ "github.com/rjevski/caddy-cloudflare-origin-ca"
	_ "github.com/socheatsok78/caddy-storage-rqlite"
)

func main() {
	caddycmd.Main()
}
