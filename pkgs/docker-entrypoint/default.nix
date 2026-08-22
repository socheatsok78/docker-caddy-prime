{
  runCommand,
}:
let
  rootfs = ./rootfs;
in
runCommand "docker-entrypoint" { } ''
  mkdir -p $out
  cp -r ${rootfs}/. $out/
''
