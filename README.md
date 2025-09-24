# Introduction to Functional Programming Solutions

[![Build status](https://github.com/forketyfork/introduction-to-functional-programming/actions/workflows/build.yml/badge.svg)](https://github.com/forketyfork/introduction-to-functional-programming/actions/workflows/build.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Miranda](https://img.shields.io/badge/language-Miranda-orange.svg)](http://miranda.org.uk/)

A Miranda implementation of solutions to exercises from **"Introduction to Functional Programming"** by Richard Bird and Philip Wadler.

This repository contains working Miranda code and test suites to help understand functional programming concepts through the Miranda programming language.

## About

This project attempts to transform exercise solutions into a proper Miranda codebase with:

- Modular source code organization
- Comprehensive test coverage
- Build system and automation
- Installation and setup documentation

## Project Structure

```
├── src/                    # Source code by chapter
│   ├── chapter01/
│   │   └── exercises.m     # Chapter 1 solutions
│   └── main.m             # Main entry point
├── tests/                 # Test suites
│   ├── test_runner.m      # Main test runner
│   └── validate.sh        # Project validation script
├── INSTALL.md             # Miranda installation guide
├── Makefile              # Build automation
└── README.md             # This file
```

## Quick Start

### 1. Install Miranda

See [INSTALL.md](INSTALL.md) for detailed installation instructions.

**Quick install (if you have Miranda sources):**
```bash
make cleanup
make
```

### 2. Validate the Project

```bash
# Check project structure and validate Miranda code
./tests/validate.sh
```

### 3. Run Tests

```bash
# Run main program with all exercises
make run

# Run test suite
make test
```

### 4. Interactive Usage

```bash
# Start Miranda interpreter with the main module
cd src
mira main.m

# In Miranda REPL:
mira> quad 3
81
mira> max 5 2
5
mira> circle_area 7
154
```

## Testing

The project includes a comprehensive test suite:

```bash
# Run all tests
make test

# Validate project structure
./tests/validate.sh

# Check basic functionality
make check
```

## Development

### Adding New Solutions

1. **Create chapter source file:**
   ```bash
   # For chapter N
   touch src/chapterN/exercises.m
   ```

2. **Implement Miranda functions:**
   ```miranda
   %export function_name

   function_name param = implementation
   ```

3. **Add tests:**
   ```miranda
   # In tests/test_runner.m
   test_function_cases = [
       test_eq expected (function_name input) "description"
   ]
   ```

### Build Commands

| Command | Description |
|---------|-------------|
| `make help` | Show available commands |
| `make run` | Execute main program |
| `make test` | Run test suite |
| `make check` | Validate installation and functionality |
| `make clean` | Clean generated files |

## Requirements

- **Miranda interpreter** (open source since 2020)
- **C compiler** (gcc/clang for building Miranda)
- **UNIX-like system** (Linux, macOS, WSL)

## Resources

### Miranda Language
- [Official Miranda Homepage](http://miranda.org.uk/)
- [Miranda Documentation](https://github.com/garrett-may/miranda-documentation)
- [Open Source Implementation](https://github.com/ncihnegn/miranda)

### Book Reference
- **Title:** Introduction to Functional Programming
- **Authors:** Richard Bird, Philip Wadler
- **Publisher:** Prentice Hall International Series in Computer Science

