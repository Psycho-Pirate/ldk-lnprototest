#!/bin/bash
echo "running lnprototest"
make 
pip3 install poetry
cd Lnprototest_Testing; poetry install && poetry run make check 
