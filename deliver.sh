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

echo
echo "to deliver:"
echo "${VENV}/bin/python -m twine upload dist/*"
echo
