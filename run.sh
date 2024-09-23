#!/bin/bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
VENV=${DIR}/venv/

if [[ "$1" == "dist" ]]
then
    # use local build
    to_install=dist/qyout-*.whl
else
    # use pypi
    to_install=qyout
fi

if [[ ! -d ${VENV} ]]
then
    python3 -m venv ${VENV}
    . ${VENV}/bin/activate
    pip install --upgrade pip
    pip install ${to_install}
fi

./${VENV}/bin/qyout
