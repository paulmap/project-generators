#!/bin/bash


# Python Project Scaffold Generator
# Usage: './create_pthon_project.sh project_name

set -e

if [ $# -eq 0 ]; then
   echo "Error: Please provide project name"
   echo "Usage: ./create_python_project.sh {project_name}"
   exit 1
fi

PROJECT_NAME="$1"

echo "Creating Python Project structure for : $PROJECT_NAME"

# Create the main project directory

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# create git repo

git init

# Create the src directory and packages
mkdir -p "src/"{models,services,utils}

# Create __init__.py files
touch "src/__init__.py"
touch "src/models/__init__.py"
touch "src/services__init__.py"
touch "src/utils/__init__.py"

# Create main entry point 
cat > "src/main.py" << EOF

"""
   Main entry point for project "$PROJECT_NAME".

"""
def main():
    """Execute the main program."""
    print("Hello from $PROJECT_NAME!")
    
if  __name__ == "__main__":
    main()
EOF

# Create the test directory

mkdir -p "tests"
touch "tests/__init__.py"
cat > "tests/test_main.py" << EOF

"""00
   Tests for the main module.

"""

import pytest

from ${PROJECT_NAME}.main import main

def test_main():
    """Test the main function. """
   # Add your test here
   assert True
EOF

# Create docs directory

mkdir -p "docs"
cat > "docs/index.md" << EOF
# $PROJECT_NAME Documentation

Welcome to the $PROJECT_NAME documentation.
EOF

# Create a README.md file

cat > "README.md" << EOF
#$PROJECT_NAME

## Description 
A professional python project.

##Installation
\'\'\'bash
pip install -e .
\'\'\'

# Usage
\'\'\'python 
from $PROJECT_NAME import main
main.main()
\'\'\'

## Licence

MIT
EOF

# create pyproject.toml file

cat > "pyproject.toml" << EOF
[build-system]
requires = ["setuptools>=42", "wheels"]
build-backend = "setuptools.build_meta"

[project]
name = "$PROJECT_NAME"
version = "0.1.0"
description = "Creates a Professional Python Project"
readme = "README.md"
authors = [{name = "Paul Maposa", email = "paul.maposa@gmail.com"}]
licence = {text = "MIT"}
classifiers = [
           "Programming Language :: Python :: 3",
           "Licence :: OSI Approved :: MIT Licence",

           ]
requires-python = ">=3.8"
dependencies = [
      # Add your dependencies here
 ]
      
[project.optional-dependencies]

dev = [

       "pytest>=7.0",
       
  ]
  
[tool-setuptools]
package-dir = {""="src"}

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = "test_*.py"


  
          
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  



