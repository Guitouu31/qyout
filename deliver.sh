#!/bin/bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
VENV=${DIR}/venv_build/

if [[ ! -d ${VENV} ]]
then
    python3 -m venv ${VENV}
    . ${VENV}/bin/activate
    pip install --upgrade pip
    pip install build twine
fi

rm -rf dist
python -m build
