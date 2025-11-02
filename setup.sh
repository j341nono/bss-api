#!/bin/bash

set -x

uv sync
uv run django-admin startproject config .
uv run manage.py startapp board
uv run manage.py makemigrations
uv run manage.py migrate
uv run manage.py createsuperuser
