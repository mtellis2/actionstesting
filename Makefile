SHELL := /bin/bash

setup: env-setup

remove: env-remove

precommit: black test

test: test

env-setup:
	conda env update -f environment.yml
	source activate actest && python -m ipykernel install --user --name actest

env-remove:
	conda env remove -n actest -y

black:
	black --target-version py38 .

test:
	pytest --cov-report term-missing --cov-branch --cov=. tests/
