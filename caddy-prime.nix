{
  buildGoModule,
  git,
}:
buildGoModule (finalAttrs: {
  pname = "caddy-prime";
  version = "2.11.4-dev";

  src = ./.;

  vendorHash = "sha256-b30B/2PDlFFSlk7tu7P925JpE06GjyG5Jc4vD9r6p/Y=";

  # See https://discourse.nixos.org/t/rethink-goproxy/23534/11
  overrideModAttrs = (
    oldAttrs: {
      impureEnvVars = oldAttrs.impureEnvVars or [ ] ++ [
        "NIX_GITHUB_PRIVATE_USERNAME"
        "NIX_GITHUB_PRIVATE_PASSWORD"
      ];

      preBuild = ''
        cat > /tmp/.netrc <<EOF
        machine github.com
            login $NIX_GITHUB_PRIVATE_USERNAME
            password $NIX_GITHUB_PRIVATE_PASSWORD
        EOF
        chmod 600 /tmp/.netrc
      '';
    }
  );

  nativeBuildInputs = [ git ];

  ldflags = [
    "-s"
    "-w"
  ];

  env = {
    HOME = "/tmp";
    # CGO_ENABLED = 0;
    GOPRIVATE = "github.com/socheatsok78/*";
  };

  tags = [
    "nobadger"
    "nomysql"
    "nopgx"
  ];
})
