# syntax = docker/dockerfile:1@sha256:9857836c9ee4268391bb5b09f9f157f3c91bb15821bb77969642813b0d00518d
# requires DOCKER_BUILDKIT=1 set when running docker build
# checkov:skip=CKV_DOCKER_2: no healthcheck (yet)
# checkov:skip=CKV_DOCKER_3: we don't want to drift away from upstream. so we keep it as it is
# checkov:skip=CKV_DOCKER_7: yes, latest is okay here
# hadolint ignore=DL3007
FROM netboxcommunity/netbox:v4.2.9@sha256:7bf0eb72ba8079ebbc053f0d324654b3482bafde2f34ff07fa6777533171c337

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
  # Install static files from our plugins
  SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input && \
  # Activate plugins
  cat /etc/netbox/config/plugins.py && \
  echo 'PLUGINS = ["netbox_qrcode","netbox_interface_synchronization","netbox_reorder_rack","netbox_topology_views","netbox_attachments","netbox_inventory","netbox_floorplan","netbox_contract","netbox_documents","netbox_lifecycle","netbox_otp_plugin","nb_service"]' >> /etc/netbox/config/plugins.py && \
  # Cleanup
  apt-get purge \
      --yes -qq \
      git && \
  apt-get -y -qq autoremove
