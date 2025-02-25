ARG UBUNTU_CODENAME=jammy

FROM ubuntu:${UBUNTU_CODENAME}

LABEL org.label-schema.maintainer="betadots GmbH <info@betadots.de>" \
      org.label-schema.vendor="betadots" \
      org.label-schema.url="https://github.com/betadots/pdc" \
      org.label-schema.name="Puppet Development Container" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vcs-url="https://github.com/betadots/pdc" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.dockerfile="/Dockerfile"

ARG TARGETARCH

# needs to be set again, otherwise it is not available in the next stage
ARG UBUNTU_CODENAME

ARG PUPPET_RELEASE
ENV PUPPET_RELEASE=${PUPPET_RELEASE:-8}

ARG PUPPET_VERSION
ENV PUPPET_VERSION=${PUPPET_VERSION:-8.9.0}

ARG TERRAFORM_VERSION
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION:-1.9.5}

ARG PDK_VERSION
ENV PDK_VERSION=${PDK_VERSION:-3.3.0.0}

ARG BOLT_VERSION
ENV BOLT_VERSION=${BOLT_VERSION:-3.30.0}

ARG PUPPETDB_TERMINI_VERSION
ENV PUPPETDB_TERMINI_VERSION=${PUPPETDB_TERMINI_VERSION:-8.7.0}

ENV DEBIAN_FRONTEND=noninteractive
ENV PUPPET_DEB=puppet${PUPPET_RELEASE}-release-${UBUNTU_CODENAME}.deb
ENV PUPPET_TOOLS_DEB=puppet-tools-release-${UBUNTU_CODENAME}.deb

ADD https://apt.puppet.com/${PUPPET_DEB} /${PUPPET_DEB}
ADD https://apt.puppet.com/${PUPPET_TOOLS_DEB} /${PUPPET_TOOLS_DEB}

RUN apt install /${PUPPET_DEB} /${PUPPET_TOOLS_DEB} \
    && rm -f /${PUPPET_DEB} /${PUPPET_TOOLS_DEB}

RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
    ca-certificates \
    git \
    locales \
    pdk=${PDK_VERSION} \
    puppet-agent=${PUPPET_VERSION} \
    puppet-bolt=${BOLT_VERSION} \
    puppetdb-termini=${PUPPETDB_TERMINI_VERSION} \
    unzip \
    yamllint \
    jq \
    && apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8 \
    && /opt/puppetlabs/puppet/bin/puppet module install puppet-catalog_diff

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip /terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip
RUN \
    unzip terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    mv terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    terraform --version

COPY Dockerfile /

ENV BOLT_DISABLE_ANALYTICS=true
ENV PDK_DISABLE_ANALYTICS=true
ENV PATH=$PATH:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
