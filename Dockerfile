FROM ubuntu:20.04

LABEL org.label-schema.maintainer="betadots GmbH <info@betadots.de>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

ADD https://apt.puppet.com/puppet7-release-focal.deb /puppet7-release-focal.deb
RUN apt install /puppet7-release-focal.deb

RUN apt update && apt install -y --no-install-recommends \
    cmake \
    curl \
    g++ \
    gcc \
    git \
    gnupg2 \
    libldap-2.4-2 \
    libldap-common \
    libssl1.1 \
    libxml2-dev \
    libxslt1-dev \
    make \
    openssh-client \
    openssl \
    pkg-config\
    wget \
    zlib1g-dev \
    yamllint \
    python3-yaml \
    puppet-agent \
    pdk \
    puppetdb-termini \
    && /opt/puppetlabs/puppet/bin/puppet module install puppet-catalog_diff
    # && /opt/puppetlabs/puppet/bin/bundle install

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

# ENTRYPOINT ["/opt/puppetlabs/bin/puppet"]
# CMD ["agent" "--verbose" "--onetime" "--no-daemonize"
