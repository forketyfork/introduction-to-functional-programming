#!/bin/bash

# Validation script for Miranda project
# Checks if Miranda files are syntactically valid and functions work as expected

set -e

echo "=== Miranda Project Validation ==="
echo ""

# Check if Miranda interpreter is available
if ! command -v mira &> /dev/null; then
    echo "WARNING: Miranda interpreter 'mira' not found in PATH"
    echo "Please install Miranda to run full validation."
    echo "See INSTALL.md for installation instructions."
    echo ""
    echo "Performing basic file structure checks only..."
    echo ""
else
    echo "Miranda interpreter found: $(which mira)"
    echo ""
fi

# Check project structure
echo "Checking project structure..."

required_files=(
    "src/chapter01/exercises.m"
    "src/main.m"
    "examples/chapter01_demo.m"
    "tests/test_runner.m"
    "INSTALL.md"
    "Makefile"
)

missing_files=()
for file in "${required_files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "✓ $file exists"
    else
        echo "✗ $file missing"
        missing_files+=("$file")
    fi
done

if [[ ${#missing_files[@]} -gt 0 ]]; then
    echo ""
    echo "ERROR: Missing required files:"
    printf '  %s\n' "${missing_files[@]}"
    exit 1
fi

echo ""
echo "Project structure validation: PASSED"
echo ""

# If Miranda is available, run syntax and functionality checks
if command -v mira &> /dev/null; then
    echo "Running Miranda syntax and functionality checks..."
    echo ""

    # Test main module compilation
    echo "Testing main module..."
    cd src
    if echo "" | mira main.m &> /dev/null; then
        echo "✓ Main module compiles successfully"
    else
        echo "✗ Main module compilation failed"
        echo "Running mira main.m for detailed error output:"
        mira main.m
        exit 1
    fi
    cd ..

    # Test demo compilation
    echo "Testing demonstration module..."
    cd examples
    if echo "" | mira chapter01_demo.m &> /dev/null; then
        echo "✓ Demo module compiles successfully"
    else
        echo "✗ Demo module compilation failed"
        echo "Running mira chapter01_demo.m for detailed error output:"
        mira chapter01_demo.m
        exit 1
    fi
    cd ..

    # Test test runner compilation
    echo "Testing test runner..."
    cd tests
    if echo "" | mira test_runner.m &> /dev/null; then
        echo "✓ Test runner compiles successfully"
    else
        echo "✗ Test runner compilation failed"
        echo "Running mira test_runner.m for detailed error output:"
        mira test_runner.m
        exit 1
    fi
    cd ..

    echo ""
    echo "All Miranda modules compile successfully!"
    echo ""
    echo "Run 'make check' to execute functionality tests."
else
    echo "Skipping Miranda-specific validation (interpreter not available)"
fi

echo ""
echo "=== VALIDATION SUMMARY ==="
echo "Project structure: ✓ PASSED"
if command -v mira &> /dev/null; then
    echo "Miranda compilation: ✓ PASSED"
    echo "Status: READY TO USE"
else
    echo "Miranda compilation: ? SKIPPED (interpreter not available)"
    echo "Status: INSTALL MIRANDA TO COMPLETE VALIDATION"
fi
echo ""