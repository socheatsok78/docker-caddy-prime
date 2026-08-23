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
    WorkingDir = "/srv";
    Entrypoint = [ "/docker-entrypoint.sh" ];
    Cmd = [
      "caddy"
      "run"
      "--adapter"
      "caddyfile"
      "--config"
      "/etc/caddy/Caddyfile"
    ];
    Env = [
      "CADDY_VERSION=${caddy-prime.version}"
      "XDG_CONFIG_HOME=/config"
      "XDG_DATA_HOME=/data"
    ];
  };
}
