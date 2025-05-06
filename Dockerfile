# checkov:skip=CKV_DOCKER_2: no healthcheck (yet)
# checkov:skip=CKV_DOCKER_3: we don't want to drift away from upstream. so we keep it as it is
# checkov:skip=CKV_DOCKER_7: yes, latest is okay here
# hadolint ignore=DL3007
FROM netboxcommunity/netbox:v4.2.8

# Update base image
RUN apt-get -q update; apt-get -qy upgrade && rm -rf /var/lib/apt/lists/* && \
  # Define required plugins
  echo 'netbox-qrcode\nnetbox-interface-synchronization\nnetbox-reorder-rack\n' >> /opt/netbox/plugin_requirements.txt && \
  # Install plugins
  /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /opt/netbox/plugin_requirements.txt && \
  # Install static files from our plugins
  SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input && \
  # Activate plugins
  cat /etc/netbox/config/plugins.py && \
  echo 'PLUGINS = ["netbox_qrcode","netbox_interface_synchronization","netbox_reorder_rack"]' >> /etc/netbox/config/plugins.py