FROM hexpm/elixir:1.13.4-erlang-25.3.2.9-ubuntu-jammy-20240808

WORKDIR /explorer

RUN addgroup --system explorer-group && \
    useradd --system explorer --uid 1002 --group explorer-group

RUN apt-get update && \
    apt-get install ca-certificates curl gnupg -y && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_URL=https://deb.nodesource.com/node_20.x && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] $NODE_URL nodistro main" | tee /etc/apt/sources.list.d/nodesource.list > /dev/null && \
    apt-get update && \
    apt-get install nodejs automake libtool inotify-tools gcc libgmp-dev make g++ openssl libssl-dev pkg-config git -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    cp -R $HOME/.cargo/bin/* /usr/local/bin/ && \
    rustup default stable

RUN git clone --branch v6.5.0-beta --single-branch https://github.com/blockscout/blockscout

RUN chmod -R 400 blockscout && \
    chown -R explorer blockscout && \
    chgrp -R explorer-group blockscout

COPY --chown=explorer:explorer-group scripts scripts

EXPOSE 4000
