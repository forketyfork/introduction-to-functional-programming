# Installing Miranda

This project provides a reproducible Nix development environment that builds
the Miranda interpreter directly from source. The flake ensures the
`mira` binary and its standard library are available for the Makefile targets
and tests in this repository.

## Recommended: Use the Nix Flake

1. [Install Nix](https://nixos.org/download/) if you don't already have it.
2. (Optional but convenient) enable
   [`direnv`](https://direnv.net/) with [nix-direnv](https://github.com/nix-community/nix-direnv)
   so the environment is loaded automatically.
3. Allow the flake for this repository:

   ```bash
   direnv allow   # if using direnv
   # or start a shell manually
   nix develop
   ```

The first activation will compile Miranda from source using the pinned
configuration in `flake.nix`. Afterwards, the `mira` command is on your `PATH`
and exported via the `MIRA` variable so that `make run`, `make demo`, and
`make test` work without any additional setup.

## Alternative: Manual Installation

If you cannot use Nix, follow the upstream instructions to build Miranda
manually:

1. Clone the open-source implementation:

   ```bash
   git clone https://github.com/ncihnegn/miranda
   cd miranda
   ```

2. Build the interpreter:

   ```bash
   make cleanup
   make
   ./mira
   ```

3. Add the resulting directory to your `PATH` or symlink `mira` into a
   location that is already on your `PATH`.

Once Miranda is installed you can run the project exercises:

```bash
cd src
mira main.m
```

For additional troubleshooting tips, consult the upstream Miranda
documentation at https://github.com/ncihnegn/miranda.
