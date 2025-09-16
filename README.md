# Custom NetBox Docker Image with Additional Plugins

This is a customized version of the official NetBox Docker image from [netbox-community/netbox-docker](https://github.com/netbox-community/netbox-docker). This variant includes several additional plugins that extend the functionality of NetBox to cater to specific use cases.

## Additional Plugins

The following plugins have been added to this custom NetBox image:

1. **[Django LDAP authentication backend](https://github.com/django-auth-ldap/django-auth-ldap)**
   Django authentication backend that authenticates against an LDAP service.

2. **[Netbox QR Code](https://github.com/netbox-community/netbox-qrcode)**
   A plugin for generate QR codes for objects: Rack, Device, Cable.

3. **[Netbox Interface Synchronization](https://github.com/NetTech2001/netbox-interface-synchronization)**
   Compare and synchronize interfaces between devices and device types

4. **[NetBox Topology Views](https://github.com/netbox-community/netbox-topology-views)**  
   Provides a graphical representation of network topology within NetBox.

5. **[NetBox Inventory Plugin](https://github.com/ArnesSI/netbox-inventory/)**
   Netbox plugin for hardware inventory.

6. **[NetBox Floorplan Plugin](https://github.com/netbox-community/netbox-floorplan-plugin.git)**
   Netbox plugin providing floorplan mapping capability for locations and sites

7. **[Netbox Documents Plugin](https://github.com/jasonyates/netbox-documents)**
   Netbox plugin designed to facilitate the storage of site, circuit, device type and device specific documents

8. **[NetBox Lifecycle Plugin](https://github.com/dansheps/netbox-lifecycle)**
   Netbox plugin for managing Hardware EOL/EOS, and Support Contracts

9. **[Netbox OTP Plugin](https://github.com/k1nky/netbox-otp-plugin)**
   Netbox plugin adds support for one-time password (OTP)

### Plugin Requirements

These plugins are based on the contents of the [plugin_requirements.txt](https://github.com/tmtde/docker-netbox/blob/development/plugin_requirements.txt) file. This file lists all the required dependencies and plugins for the NetBox instance running with this Docker image.

You can check and modify the plugin list in the source repository if you want to customize your installation further.
