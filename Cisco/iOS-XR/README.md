# General guidelines
Details on how to use the below templates to configure an iOS-XR running equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# iOS XR configuration notes
* by default on the iOS XR platform, interfaces' ifIndex isn't persisted across reboots - you will need the following global config statement to resolve this issue (it is included in the snmp.conf file in this directory):
```
snmp-server ifindex persist
```
