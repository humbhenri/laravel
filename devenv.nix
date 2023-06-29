{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.nodejs-18_x pkgs.yarn pkgs.php81 pkgs.php81Packages.composer];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    if [[ ! -d vendor ]]; then
        composer install
    fi
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
  languages.php.package = pkgs.php81.buildEnv {
    extraConfig = ''
      memory_limit = 256m
    '';
  };
}
