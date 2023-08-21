VERSION 0.7

nix:
    FROM github.com/jmgilman/earthly-nix+nix
    DO github.com/jmgilman/earthly-nix+SETUP

    WORKDIR /work

check:
    FROM +nix

    COPY . .
    RUN with_nix treefmt --fail-on-change .