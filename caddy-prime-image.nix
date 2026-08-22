{
  callPackage,
  dockerTools,
  busybox,
  caddy-prime,
}:
let
  caddyfile = callPackage ./pkgs/caddyfile { };
  docker-entrypoint = callPackage ./pkgs/docker-entrypoint { };
  index = callPackage ./pkgs/index { };
in
dockerTools.buildLayeredImage {
  name = "caddy-prime";
  tag = caddy-prime.version;
  contents = [
    dockerTools.fakeNss
    busybox
    docker-entrypoint
    caddyfile
    index
    caddy-prime
  ];
  config = {
    Entrypoint = [ "/docker-entrypoint.sh" ];
    Cmd = [
      "caddy"
      "run"
      "--adapter"
      "caddyfile"
      "--config"
      "/etc/caddy/Caddyfile"
    ];
  };
}
