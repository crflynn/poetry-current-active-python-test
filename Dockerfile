FROM ubuntu:21.10

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get install -y curl git nano make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-venv
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

ENV PATH=$PATH:/root/.asdf/bin:/root/.asdf/shims:/root/.local/bin
RUN asdf plugin add python
RUN asdf install python 3.7.12
RUN asdf install python 3.9.9
RUN asdf global python 3.7.12

WORKDIR /app
RUN curl -sSL https://install.python-poetry.org | python3 - --git "https://github.com/finswimmer/poetry.git@proof-of-concept-pyenv"
RUN poetry config virtualenvs.prefer-active-python true
RUN poetry config virtualenvs.in-project true

WORKDIR /app/project
ADD pyproject.toml .
ADD commands.sh .
