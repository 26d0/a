{
  description = "A random English word containing an interior ass";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.writeShellScriptBin "a" (
            builtins.replaceStrings
              [ "nix run nixpkgs#xkcdpass --" ]
              [ "exec ${pkgs.xkcdpass}/bin/xkcdpass" ]
              (builtins.readFile ./main.sh)
          );
        });

      apps = forAllSystems (system: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/a";
          meta.description = self.description;
        };
      });
    };
}
