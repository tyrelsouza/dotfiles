python setup.py clean
python setup.py sdist bdist_wheel
gpg --detach-sign -a dist/*.gz
gpg --detach-sign -a dist/*.whl
twine upload dist/*
