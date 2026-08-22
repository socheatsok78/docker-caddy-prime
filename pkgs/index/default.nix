{
  writeTextFile,
}:
writeTextFile {
  name = "index.html";
  destination = "/usr/share/caddy/index.html";
  text = builtins.readFile ./index.html;
}
