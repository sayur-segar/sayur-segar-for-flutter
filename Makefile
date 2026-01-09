.PHONY: help install test lint format analyze clean build example widgetbook publish publish-dry-run all

# Default target
.DEFAULT_GOAL := help

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m # No Color

## help: Show this help message
help:
	@echo "$(BLUE)Available targets:$(NC)"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

## install: Install all dependencies (main package, example, widgetbook)
install:
	@echo "$(GREEN)Installing main package dependencies...$(NC)"
	flutter pub get
	@echo "$(GREEN)Installing example dependencies...$(NC)"
	cd example && flutter pub get
	@echo "$(GREEN)Installing widgetbook dependencies...$(NC)"
	cd widgetbook && flutter pub get
	@echo "$(GREEN)✓ All dependencies installed!$(NC)"

## test: Run all tests
test:
	@echo "$(GREEN)Running tests...$(NC)"
	flutter test

## lint: Run linter
lint:
	@echo "$(GREEN)Running linter...$(NC)"
	flutter analyze

## format: Format all Dart code
format:
	@echo "$(GREEN)Formatting code...$(NC)"
	dart format lib example/lib widgetbook/lib

## format-check: Check if code is formatted (CI)
format-check:
	@echo "$(GREEN)Checking code formatting...$(NC)"
	dart format --set-exit-if-changed lib example/lib widgetbook/lib

## analyze: Run analyzer (alias for lint)
analyze: lint

## clean: Clean build artifacts
clean:
	@echo "$(GREEN)Cleaning build artifacts...$(NC)"
	flutter clean
	cd example && flutter clean
	cd widgetbook && flutter clean
	@echo "$(GREEN)✓ Clean complete!$(NC)"

## build: Build the package
build:
	@echo "$(GREEN)Building package...$(NC)"
	flutter pub get
	flutter analyze

## example: Run example app
example:
	@echo "$(GREEN)Running example app...$(NC)"
	cd example && flutter run

## example-web: Run example app on web
example-web:
	@echo "$(GREEN)Running example app on web...$(NC)"
	cd example && flutter run -d chrome

## widgetbook: Run widgetbook (Storybook for Flutter)
widgetbook:
	@echo "$(GREEN)Running Widgetbook...$(NC)"
	cd widgetbook && flutter run -d chrome

## widgetbook-device: Run widgetbook on any available device
widgetbook-device:
	@echo "$(GREEN)Running Widgetbook...$(NC)"
	cd widgetbook && flutter run

## publish-dry-run: Validate package before publishing (dry-run)
publish-dry-run:
	@echo "$(YELLOW)Running publish dry-run...$(NC)"
	flutter pub publish --dry-run

## publish: Publish package to pub.dev
publish:
	@echo "$(YELLOW)⚠️  Publishing to pub.dev...$(NC)"
	@read -p "Are you sure you want to publish? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		flutter pub publish; \
	else \
		echo "$(YELLOW)Publish cancelled.$(NC)"; \
	fi

## check: Run all checks (format, lint, test)
check: format-check lint test
	@echo "$(GREEN)✓ All checks passed!$(NC)"

## pre-commit: Run checks before committing
pre-commit: format lint test
	@echo "$(GREEN)✓ Pre-commit checks passed!$(NC)"

## outdated: Check for outdated dependencies
outdated:
	@echo "$(GREEN)Checking for outdated dependencies...$(NC)"
	flutter pub outdated
	@echo "$(GREEN)Checking example dependencies...$(NC)"
	cd example && flutter pub outdated
	@echo "$(GREEN)Checking widgetbook dependencies...$(NC)"
	cd widgetbook && flutter pub outdated

## upgrade: Upgrade all dependencies
upgrade:
	@echo "$(GREEN)Upgrading main package dependencies...$(NC)"
	flutter pub upgrade
	@echo "$(GREEN)Upgrading example dependencies...$(NC)"
	cd example && flutter pub upgrade
	@echo "$(GREEN)Upgrading widgetbook dependencies...$(NC)"
	cd widgetbook && flutter pub upgrade
	@echo "$(GREEN)✓ All dependencies upgraded!$(NC)"

## version: Show current version
version:
	@grep "^version:" pubspec.yaml

## changelog: View changelog
changelog:
	@cat CHANGELOG.md

## doctor: Run Flutter doctor
doctor:
	@echo "$(GREEN)Running Flutter doctor...$(NC)"
	flutter doctor -v

## devices: List available devices
devices:
	@echo "$(GREEN)Available devices:$(NC)"
	flutter devices

## setup: Complete setup (install + format + analyze)
setup: install format analyze
	@echo "$(GREEN)✓ Setup complete!$(NC)"

## all: Run format, lint, test, and build (comprehensive check)
all: format lint test build
	@echo "$(GREEN)✓ All checks completed successfully!$(NC)"

## ci: Run CI checks (for CI/CD pipeline)
ci: format-check lint test
	@echo "$(GREEN)✓ CI checks passed!$(NC)"

