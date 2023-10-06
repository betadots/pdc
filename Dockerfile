FROM ubuntu:22.04

LABEL org.label-schema.maintainer="betadots GmbH <info@betadots.de>" \
      org.label-schema.vendor="betadots" \
      org.label-schema.url="https://github.com/betadots/pdc" \
      org.label-schema.name="Puppet Development Container" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vcs-url="https://github.com/betadots/pdc" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.dockerfile="/Dockerfile"

ARG PUPPET_VERSION
ENV PUPPET_VERSION=${PUPPET_VERSION:-7}

ENV DEBIAN_FRONTEND=noninteractive
ENV PUPPET_DEB=puppet${PUPPET_VERSION}-release-jammy.deb

ADD https://apt.puppet.com/${PUPPET_DEB} /${PUPPET_DEB}

RUN apt install /${PUPPET_DEB} \
    && rm -f /${PUPPET_DEB}

RUN apt update && apt install -y --no-install-recommends \
    ca-certificates \
    cmake \
    curl \
    g++ \
    gcc \
    git \
    gnupg2 \
    libldap-2.5-0 \
    libldap-common \
    libxml2-dev \
    libxslt1-dev \
    locales \
    make \
    openssh-client \
    openssl \
    pdk \
    pkg-config\
    puppet-agent \
    puppet-bolt \
    puppetdb-termini \
    python3-yaml \
    wget \
    yamllint \
    zlib1g-dev \
    && apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && /opt/puppetlabs/puppet/bin/puppet module install puppet-catalog_diff \
    && locale-gen en_US.UTF-8
    # && /opt/puppetlabs/puppet/bin/bundle install

ENV BOLT_DISABLE_ANALYTICS=true
ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# ENTRYPOINT ["/opt/puppetlabs/bin/puppet"]
# CMD ["agent" "--verbose" "--onetime" "--no-daemonize"
