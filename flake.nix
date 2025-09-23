{
  description = "Development environment for Introduction to Functional Programming using Miranda";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systems = nixpkgs.lib.systems.flakeExposed;

      forEachSystem = nixpkgs.lib.genAttrs systems;
    in
    rec {
      packages = forEachSystem (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          miranda = pkgs.stdenv.mkDerivation {
            pname = "miranda";
            version = "unstable-2025-05-25";

            src = pkgs.fetchFromGitHub {
              owner = "ncihnegn";
              repo = "miranda";
              rev = "21206e7dab13afd681b6f16d2482a5e8180223bb";
              sha256 = "sha256-UjEDFif5oA9SzfKgeZ9R+0bOHRAoVphCIoDCsFBUDJA=";
            };

            nativeBuildInputs = [
              pkgs.byacc
              pkgs.makeWrapper
              pkgs.gcc
            ];

            dontConfigure = true;

            buildPhase = ''
              runHook preBuild
              export BUILD_DATE="25 May 2025"

              # Create a proper .host file instead of relying on gcc -v
              echo "compiled on Nix build system" > .host

              make
              runHook postBuild
            '';

            postPatch = ''
              substituteInPlace Makefile \
                --replace "\`git show -s --format=%cd --date=format:'%d %b %Y'\`" '$(BUILD_DATE)' \
                --replace '$(CC) -v 2>> .host' '$(CC) -v 2>> .host || true'
            '';

            installPhase = ''
              runHook preInstall

              mkdir -p "$out/bin"
              mkdir -p "$out/lib/miralib"
              mkdir -p "$out/share/man/man1"

              cp mira "$out/bin/"
              cp -r miralib/. "$out/lib/miralib/"
              cp mira.1 "$out/share/man/man1/"

              wrapProgram "$out/bin/mira" \
                --set MIRALIB "$out/lib/miralib"

              runHook postInstall
            '';

            meta = with pkgs.lib; {
              description = "Miranda functional programming language implementation";
              homepage = "https://github.com/ncihnegn/miranda";
              license = licenses.gpl2;
              maintainers = [];
              platforms = platforms.unix;
            };
          };
        in
        {
          inherit miranda;
          default = miranda;
        }
      );

      devShells = forEachSystem (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          miranda = packages.${system}.miranda;
        in
        {
          default = pkgs.mkShell {
            packages = [
              miranda
              pkgs.gnumake
              pkgs.git
            ];

            shellHook = ''
              export MIRA=${miranda}/bin/mira
            '';
          };
        }
      );
    };
}
