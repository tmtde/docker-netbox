# syntax = docker/dockerfile:1@sha256:dabfc0969b935b2080555ace70ee69a5261af8a8f1b4df97b9e7fbcf6722eddf
# requires DOCKER_BUILDKIT=1 set when running docker build
# checkov:skip=CKV_DOCKER_2: no healthcheck (yet)
# checkov:skip=CKV_DOCKER_3: we don't want to drift away from upstream. so we keep it as it is
# checkov:skip=CKV_DOCKER_7: yes, latest is okay here
# hadolint ignore=DL3007
FROM netboxcommunity/netbox:v4.4.1@sha256:8aa0f2a5965231486f04f86f01eb345bef82d91dfc503f1110abab044d8e9eb3

COPY ./plugin_requirements.txt /opt/netbox/

# Update base image
RUN apt-get -q update; apt-get -qy upgrade && \
  # Install needed packages
  apt-get install \
      --yes -qq --no-install-recommends \
      git=* && \
  # Cleanup
  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
  # Install plugins
  /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt && \
  # Activate plugins
  cat /etc/netbox/config/plugins.py && \
  echo 'PLUGINS = ["netbox_qrcode","netbox_topology_views","netbox_inventory","netbox_floorplan","netbox_documents","netbox_lifecycle","netbox_otp_plugin"]' >> /etc/netbox/config/plugins.py && \
  # Install static files from our plugins
  DEBUG="true" SECRET_KEY="dummyKeyWithMinimumLength-------------------------" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input && \
  # Cleanup
  apt-get purge \
      --yes -qq \
      git && \
  apt-get -y -qq autoremove
