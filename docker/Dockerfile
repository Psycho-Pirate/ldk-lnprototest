FROM ubuntu:20.04
LABEL mantainer="Prakhar Saxena prakharrsaxena@gmail.com"

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Ubuntu utils
RUN apt-get update && apt-get install -y \
    software-properties-common  \
    build-essential \
    curl wget

RUN apt-get update

## Install Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

# Install bitcoin core
RUN add-apt-repository ppa:luke-jr/bitcoincore
RUN apt-get update && apt-get install -y \
  bitcoind jq libsodium-dev libpq-dev \
  autoconf automake build-essential git libtool libgmp-dev libsqlite3-dev \
  python3 python3-pip net-tools zlib1g-dev libsodium-dev gettext \
  pkg-config libssl-dev cmake

# Install Lnprototest
RUN git clone https://github.com/rustyrussell/lnprototest.git /workdir/lnprototest

# Set PYTHONPATH environment variable
ENV PYTHONPATH="/workdir/lnprototest"

WORKDIR workdir
COPY . .

CMD ["./docker/entrypoint.sh"]
