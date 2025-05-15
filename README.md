# Custom NetBox Docker Image with Additional Plugins

This is a customized version of the official NetBox Docker image from [netbox-community/netbox-docker](https://github.com/netbox-community/netbox-docker). This variant includes several additional plugins that extend the functionality of NetBox to cater to specific use cases.

## Additional Plugins

The following plugins have been added to this custom NetBox image:

1. **[Django LDAP authentication backend](https://github.com/django-auth-ldap/django-auth-ldap)**
   Django authentication backend that authenticates against an LDAP service.

2. **[Netbox QR Code](https://github.com/netbox-community/netbox-qrcode)**
   A plugin for generate QR codes for objects: Rack, Device, Cable.

3. **[Netbox Reorder Rack Plugin](https://github.com/netbox-community/netbox-reorder-rack)**
   Allow the ability to reorder rack units in NetBox using a drag and drop interface.

4. **[Netbox Interface Synchronization](https://github.com/NetTech2001/netbox-interface-synchronization)**
   Compare and synchronize interfaces between devices and device types

5. **[NetBox Topology Views](https://github.com/netbox-community/netbox-topology-views)**  
   Provides a graphical representation of network topology within NetBox.

6. **[NetBox Attachments Plugin](https://github.com/Kani999/netbox-attachments)**
   Plugin to manage attachments for any model

7. **[NetBox Inventory Plugin](https://github.com/ArnesSI/netbox-inventory/)**
   Netbox plugin for hardware inventory.

8. **[NetBox Floorplan Plugin](https://github.com/netbox-community/netbox-floorplan-plugin.git)**
   Netbox plugin providing floorplan mapping capability for locations and sites

9. **[Netbox Contract Plugin](https://github.com/mlebreuil/netbox-contract)**
   NetBox plugin to manage contracts

10. **[Netbox Documents Plugin](https://github.com/jasonyates/netbox-documents)**
    Netbox plugin designed to facilitate the storage of site, circuit, device type and device specific documents

11. **[NetBox Lifecycle Plugin](https://github.com/dansheps/netbox-lifecycle)**
    Netbox plugin for managing Hardware EOL/EOS, and Support Contracts

12. **[Netbox OTP Plugin](https://github.com/k1nky/netbox-otp-plugin)**
    Netbox plugin adds support for one-time password (OTP)

13. **[Netbox Nbservice](https://github.com/renatoalmeidaoliveira/nbservice)**
    Netbox Plugin for ITSM service mapping

### Plugin Requirements

These plugins are based on the contents of the [plugin_requirements.txt](https://github.com/tmtde/docker-netbox/blob/development/plugin_requirements.txt) file. This file lists all the required dependencies and plugins for the NetBox instance running with this Docker image.

You can check and modify the plugin list in the source repository if you want to customize your installation further.
