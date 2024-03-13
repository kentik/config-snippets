# General guidelines
Details on how to use the below templates to configure an Juniper SRX equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Juniper SRX configuration notes
## Miscellaneous useful notes
* Juniper SRX devices support only inline Jflow sampling.
* Firewalls must persist SNMP interface IDs across reboots, this is usually done by default on SRX devices
* Branch SRXs (non-chassis based) do not support MPLS so no configuration examples are provided for such
* Juniper provides some good information in their [docs] (https://supportportal.juniper.net/s/article/SRX-Getting-Started-Configure-J-Flow?language=en_US)

## Additional config required on interfaces
The ```ipfix-interfaces.conf``` display these additionally required stanzas.
* Add this to active interfaces:
```
family inet {
  sampling {
    input;
  }
}
```