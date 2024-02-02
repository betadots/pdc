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
ENV PUPPET_RELEASE=${PUPPET_RELEASE:-7}

ARG PUPPET_VERSION
ENV PUPPET_VERSION=${PUPPET_VERSION:-7.27.0}

ARG TERRAFORM_VERSION
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION:-1.6.2}

ARG PDK_VERSION
ENV PDK_VERSION=${PDK_VERSION:-3.0.1.3}

ARG BOLT_VERSION
ENV BOLT_VERSION=${BOLT_VERSION:-3.27.4}

ARG PUPPETDB_TERMINI_VERSION
ENV PUPPETDB_TERMINI_VERSION=${PUPPETDB_TERMINI_VERSION:-7.15.0}

ENV DEBIAN_FRONTEND=noninteractive
ENV PUPPET_DEB=puppet${PUPPET_RELEASE}-release-${UBUNTU_CODENAME}.deb

ADD https://apt.puppet.com/${PUPPET_DEB} /${PUPPET_DEB}

RUN apt install /${PUPPET_DEB} \
    && rm -f /${PUPPET_DEB}

RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
    ca-certificates \
    git \
    locales \
    pdk=${PDK_VERSION}-1${UBUNTU_CODENAME} \
    puppet-agent=${PUPPET_VERSION}-1${UBUNTU_CODENAME} \
    puppet-bolt=${BOLT_VERSION}-1${UBUNTU_CODENAME} \
    puppetdb-termini=${PUPPETDB_TERMINI_VERSION}-1${UBUNTU_CODENAME} \
    unzip \
    yamllint \
    && apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && /opt/puppetlabs/puppet/bin/puppet module install puppet-catalog_diff \
    && locale-gen en_US.UTF-8

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip /terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip
RUN \
    unzip terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    mv terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    terraform --version

ENV BOLT_DISABLE_ANALYTICS=true
ENV PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY Dockerfile /

# ENTRYPOINT ["/opt/puppetlabs/bin/puppet"]
# CMD ["agent" "--verbose" "--onetime" "--no-daemonize"
