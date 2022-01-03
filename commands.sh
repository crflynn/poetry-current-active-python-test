# test with local asdf
echo "asdf local"
asdf local python 3.9.9
poetry run python -V
rm -rf .venv
asdf local python 3.7.12
poetry run python -V
rm -rf .venv

# test with global asdf
rm .tool-versions
echo "asdf global"
asdf global python 3.9.9
poetry run python -V
rm -rf .venv
asdf global python 3.7.12
poetry run python -V
rm -rf .venv

# disable and see what it picks up
echo "config disabled"
poetry config virtualenvs.prefer-active-python false
asdf global python 3.9.9
poetry run python -V
rm -rf .venv
asdf global python 3.7.12
poetry run python -V
rm -rf .venv
