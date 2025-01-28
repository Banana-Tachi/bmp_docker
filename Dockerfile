FROM ubuntu:22.04

# Set environment variables
ENV LANG=en_US.UTF-8 \
    TZ=Asia/Tokyo

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       locales \
       tzdata \
       ca-certificates \
       curl \
       git \
       vim \
       gnupg && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    # Install Node.js and Yarn
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs yarn && \
    # Cleanup
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create workspace directory
WORKDIR /work

# Keep container running
CMD ["/bin/bash"]