let
  rev = "5dbd28d75410738ee7a948c7dec9f9cb5a41fa9d";
  src = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = "1amwmy0hihhd9ylr0zbpwr8bmqbh8g003yydzqqckk0ql50dm97x";
  };
  pkgs = import src {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    julia_15
  ];
}