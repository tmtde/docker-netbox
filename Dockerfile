# syntax = docker/dockerfile:1@sha256:38387523653efa0039f8e1c89bb74a30504e76ee9f565e25c9a09841f9427b05
# requires DOCKER_BUILDKIT=1 set when running docker build
# checkov:skip=CKV_DOCKER_2: no healthcheck (yet)
# checkov:skip=CKV_DOCKER_3: we don't want to drift away from upstream. so we keep it as it is
# checkov:skip=CKV_DOCKER_7: yes, latest is okay here
# hadolint ignore=DL3007
FROM netboxcommunity/netbox:v4.3.7@sha256:d53b7072b4f96aee3c66be8f12f339e8284dc25f115bb5bc7208a2e52d6aaa1f

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
  echo 'PLUGINS = ["netbox_qrcode","netbox_topology_views","netbox_inventory","netbox_floorplan","netbox_documents","netbox_lifecycle","netbox_otp_plugin","netbox-librenms-plugin"]' >> /etc/netbox/config/plugins.py && \
  # Install static files from our plugins
  DEBUG="true" SECRET_KEY="dummyKeyWithMinimumLength-------------------------" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input && \
  # Cleanup
  apt-get purge \
      --yes -qq \
      git && \
  apt-get -y -qq autoremove
