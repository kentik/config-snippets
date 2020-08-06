# General guidelines
Details on how to use the below templates to configure a Timetra/Alcatel/Lucent/Nokia routing equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Nokia configuration notes
* Nokia/Alcaltel/Lucent routers will re-shuffle SNMP interface IDs upon rebook, to circumvent this issue, make sure to implement the config in [snmp.conf](https://github.com/kentik/config-snippets/blob/master/Nokia/snmp.conf)

* Nokia/Alcatel/Lucent routers use an internal global IF index ID as the incoming and outgoing interface in their flow records. These are NOT the same SNMP ifIndex interface identifiers used in flow by most other devices. In order to use the SNMP ifIndex in the flow data so that Kentik can correlate this data with the SNMP IF-MIB table, the be sure to set "use-vrtr-if-index" under config -> clfowd More information can be found in Nokia's documentation (https://infocenter.nokia.com/public/7750SR140R4/topic/com.sr.router.config/html/cflowd_cli.html#tgardner5iexrn6muno)
