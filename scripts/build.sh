#!/bin/bash

python=python
echo Testing python executable version
$python -c "import sys; exit(0 if sys.version_info > (3,6) else 1)"
if [ $? -ne 0 ]
then
	echo Using python3.6
	python=python3.6
fi

echo Installing wheel and pip
$python -m pip install --upgrade wheel pip

echo Installing requirements
$python -m pip install --upgrade -r requirements.txt

echo Building documentation
make
