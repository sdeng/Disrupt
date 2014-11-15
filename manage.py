#!/usr/bin/env python
import os
import sys

project_path = os.path.normpath(os.path.abspath(os.path.dirname(__file__)) + "/src")
if project_path not in sys.path:
        sys.path.append(project_path)

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings.local")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
