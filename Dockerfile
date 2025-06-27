# Use official Erlang image (full version for build tools)
FROM erlang:27.3.4.0

# Set rebar3 version
ARG REBAR3_VERSION="3.24.0"

# Set working directory for the application
WORKDIR /app

# Copy application source code
COPY . ./

# Default command (keep container running for debugging)
CMD ["tail", "-f", "/dev/null"]
