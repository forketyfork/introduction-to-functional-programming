{
  description = "Development environment for Introduction to Functional Programming using Miranda";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
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
            sha256 = "sha256-LbJk5qd7yRp60z+us1UH67Ft1hPgo1pmCcmYyMCWm4o=";
          };

          nativeBuildInputs = [
            pkgs.byacc
            pkgs.makeWrapper
          ];

          dontConfigure = true;

          buildPhase = ''
            runHook preBuild
            make $makeFlags
            runHook postBuild
          '';

          postPatch = ''
            substituteInPlace Makefile \
              --replace '`git show -s --format=%cd --date=format:'\''%d %b %Y'\''`' '$(BUILD_DATE)'
          '';

          makeFlags = [
            ''BUILD_DATE="25 May 2025"''
          ];

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
        packages = {
          default = miranda;
          inherit miranda;
        };

        devShells.default = pkgs.mkShell {
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
}
