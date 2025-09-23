# Installing Miranda

This project requires the Miranda programming language interpreter. Follow the instructions below to install Miranda on your system.

## Prerequisites

- C compiler (gcc or clang)
- make
- UNIX-like system (Linux, macOS, WSL)

## Installation Steps

### Option 1: Download from Official Site (Recommended)

1. Visit the official Miranda homepage: http://miranda.org.uk/
2. Download the latest Miranda source code from the downloads section
3. Extract the archive to a directory of your choice

### Option 2: Clone from Repository

```bash
# Clone the open source Miranda implementation
git clone https://codeberg.org/miranda-ng/miranda.git
cd miranda
```

### Building Miranda

1. Navigate to the Miranda source directory
2. Clean any existing build artifacts:
   ```bash
   make cleanup
   ```

3. Build Miranda:
   ```bash
   make
   ```

4. Test the installation:
   ```bash
   ./mira
   ```

### Adding Miranda to PATH (Optional)

To use Miranda from anywhere, add it to your PATH:

```bash
# Add to your ~/.bashrc, ~/.zshrc, or equivalent
export PATH="/path/to/miranda:$PATH"
```

Or create a symlink:
```bash
sudo ln -s /path/to/miranda/mira /usr/local/bin/mira
```

## Usage

### Running Miranda Scripts

```bash
# Run a Miranda script
mira script.m

# Interactive mode
mira
```

### Example Session

```miranda
mira> 2 + 3
5
mira> let double x = x * 2
mira> double 5
10
mira> /q
```

## Project Usage

Once Miranda is installed, you can run the exercises:

```bash
cd src
mira main.m
```

## Troubleshooting

- If you encounter build errors, check that you have a C11/C18 compatible compiler
- On macOS, you may need to install Xcode command line tools: `xcode-select --install`
- On Ubuntu/Debian, install build essentials: `sudo apt-get install build-essential`

## References

- Miranda homepage: http://miranda.org.uk/
- GitHub mirror: https://github.com/ncihnegn/miranda
- Documentation: https://github.com/garrett-may/miranda-documentation