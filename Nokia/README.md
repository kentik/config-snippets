# Nokia routing platform gotchas
* Nokia/Alcaltel/Lucent routers will re-shuffle SNMP interface IDs upon rebook, to circumvent this issue, make sure to implement the config in [snmp.conf](https://github.com/kentik/config-snippets/blob/master/Nokia/snmp.conf)
