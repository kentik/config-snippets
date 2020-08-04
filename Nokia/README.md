# General guidelines
Details on how to use the below templates to configure a Timetra/Alcatel/Lucent/Nokia routing equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Nokia configuration notes
* Nokia/Alcaltel/Lucent routers will re-shuffle SNMP interface IDs upon reboot, to circumvent this issue, make sure to implement the config in [snmp.conf](https://github.com/kentik/config-snippets/blob/master/Nokia/snmp.conf)
