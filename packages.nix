{
  pkgs ? import <nixpkgs> { },
}:
rec {
  default = caddy-prime;

  caddy-prime = pkgs.callPackage ./caddy-prime.nix { };
  caddy-prime-image = pkgs.callPackage ./caddy-prime-image.nix {
    inherit caddy-prime;
  };
}
