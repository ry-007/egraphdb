# Use an official Erlang/OTP 20 image as the base
# The tag 'erlang:20.3.8.26-stretch' exists and is based on Debian Stretch.
# Note: This image is amd64 and will run via Rosetta 2 emulation on M1.
# Erlang/OTP 20 is End-of-Life and should not be used for new development.
FROM erlang:20.3

# Set the version for rebar3 (using a modern rebar3 for better compatibility with current build systems)
ARG REBAR3_VERSION="3.14.1"

# Install necessary tools:
# curl for downloading rebar3
# git if your project needs to fetch dependencies via git
# build-essential might not be strictly needed for runtime, but good for rebar3 or potential compilation.
# (The base image might already have some of these, but explicit install ensures they are present)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

# Download and install rebar3
WORKDIR /tmp
# RUN curl -k -fSL "https://github.com/rebar/rebar3/releases/download/${REBAR3_VERSION}/rebar3" -o "rebar3" \
#     && chmod +x rebar3 \
#     && mv rebar3 /usr/local/bin/

# Set working directory for your application
WORKDIR /app

COPY . ./

# Set a default command for the container
# CMD ["rebar3", "shell"]
CMD ["tail","-f","/dev/null"]
