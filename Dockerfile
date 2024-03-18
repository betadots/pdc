ARG UBUNTU_CODENAME=bullseye
ARG BASE_IMAGE

FROM $BASE_IMAGE

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
ENV PUPPET_VERSION=${PUPPET_VERSION:-7.29.1}

ARG TERRAFORM_VERSION
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION:-1.7.4}

ARG PDK_VERSION
ENV PDK_VERSION=${PDK_VERSION:-3.0.1.3}

ARG BOLT_VERSION
ENV BOLT_VERSION=${BOLT_VERSION:-3.27.4}

ARG PUPPETDB_TERMINI_VERSION
ENV PUPPETDB_TERMINI_VERSION=${PUPPETDB_TERMINI_VERSION:-7.15.0}

ARG RUBYGEM_BUNDLER
ENV RUBYGEM_BUNDLER=${RUBYGEM_BUNDLER:-2.5.6}

ARG RUBYGEM_VOXPUPULI_TEST
ENV RUBYGEM_VOXPUPULI_TEST=${RUBYGEM_VOXPUPULI_TEST:-7.1.0}

ARG RUBYGEM_VOXPUPULI_ACCEPTANCE
ENV RUBYGEM_VOXPUPULI_ACCEPTANCE=${RUBYGEM_VOXPUPULI_ACCEPTANCE:-3.0.0}

ARG RUBYGEM_VOXPUPULI_RELEASE
ENV RUBYGEM_VOXPUPULI_RELEASE=${RUBYGEM_VOXPUPULI_RELEASE:-3.0.1}

ARG RUBYGEM_PUPPET_METADATA
ENV RUBYGEM_PUPPET_METADATA=${RUBYGEM_PUPPET_METADATA:-3.6.0}

ARG RUBYGEM_OVERCOMMIT
ENV RUBYGEM_OVERCOMMIT=${RUBYGEM_OVERCOMMIT:-0.63.0}

ARG RUBYGEM_MODULESYNC
ENV RUBYGEM_MODULESYNC=${RUBYGEM_MODULESYNC:-3.2.0}

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
    && locale-gen en_US.UTF-8 \
    && /opt/puppetlabs/puppet/bin/puppet module install puppet-catalog_diff \
    && gem install bundler -v ${RUBYGEM_BUNDLER} --no-document

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip /terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip
RUN \
    unzip terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    mv terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    terraform --version

COPY pdc/Gemfile /
COPY Dockerfile /

RUN bundle config set path.system true && \
    bundle install

ENV BOLT_DISABLE_ANALYTICS=true
ENV PDK_DISABLE_ANALYTICS=true
ENV PATH=$PATH:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
