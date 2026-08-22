{
  writeTextFile,
}:
writeTextFile {
  name = "caddyfile";
  destination = "/etc/caddy/Caddyfile";
  text = builtins.readFile ./Caddyfile;
}
