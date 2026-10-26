# Makefile

PYTHON := .venv/bin/python
PIP := .venv/bin/pip
PYTEST := .venv/bin/pytest
LOG_LEVEL ?= WARNING

.PHONY: help venv install tests lint clean

help:
	@echo "Available targets:"
	@echo "  make venv       Create virtual environment"
	@echo "  make install    Install project and dev dependencies"
	@echo "  make tests      Run tests (LOG_LEVEL=DEBUG|INFO|WARNING|ERROR)"
	@echo "  make lint       Run pylint on src and tests"
	@echo "  make clean      Remove caches"

venv:
	python3 -m venv .venv
	$(PIP) install --upgrade pip

install:
	$(PIP) install -e ".[dev]"

tests:
	$(PYTEST) -v --log-cli-level=$(LOG_LEVEL)


lint:
	$(PYTHON) -m pylint src tests

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -name "*.pyc" -delete
