# Makefile for Introduction to Functional Programming - Miranda Solutions

# Default Miranda interpreter command
MIRA = mira

# Source directories
SRC_DIR = src
EXAMPLES_DIR = examples
TESTS_DIR = tests

# Main entry points
MAIN_SRC = $(SRC_DIR)/main.m

.PHONY: help run test clean check-mira

help:
	@echo "Available targets:"
	@echo "  run       - Run the main program"
	@echo "  test      - Run tests (if available)"
	@echo "  check     - Check if Miranda is installed and working"
	@echo "  clean     - Clean generated files"
	@echo "  help      - Show this help message"

check-mira:
	@which $(MIRA) > /dev/null || { echo "Error: Miranda interpreter ($(MIRA)) not found. Please install Miranda first."; echo "See INSTALL.md for instructions."; exit 1; }
	@echo "Miranda interpreter found: $$(which $(MIRA))"

run: check-mira
	@echo "Running main program..."
	cd $(SRC_DIR) && $(MIRA) main.m

test: check-mira
	@echo "Running tests..."
	@if [ -f "$(TESTS_DIR)/test_runner.m" ]; then \
		cd $(TESTS_DIR) && $(MIRA) test_runner.m; \
	else \
		echo "No tests available yet. Run 'make run'."; \
	fi

check: run
	@echo "Basic functionality check completed successfully!"

clean:
	@echo "Cleaning generated files..."
	find . -name "*.o" -type f -delete 2>/dev/null || true
	find . -name "*.obj" -type f -delete 2>/dev/null || true
	@echo "Clean completed."

# Development targets
dev-structure:
	@echo "Current project structure:"
	tree -I '.git' . || find . -type d | grep -E "src|examples|tests" | sort
