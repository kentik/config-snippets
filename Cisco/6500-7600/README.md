# General guidelines
Details on how to use the below templates to configure Cisco 65xx/76xx equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Notes on Cisco 65xx / 76xx:
* SNMP configuration requires ifIndex persistence upon reboot to be enabled, as it isn't by default.
* when configuring a Cisco 6500/7600 l3 switch, layer-2 traffic between ports on the same VLAN is not exported as NetFlow until it becomes layer-3 switched/routed
* further details available in [Cisco Documentation on NetFlow](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst6500/ios/12-2SX/configuration/guide/book/nde.html#wpxref81329)
* the following statements need to be inserted for each interface and subinterface where flow export is desired (see netflow-9-interfaces.conf file)
```
mls netflow sampling
flow-sampler <your_sampler_name>
```
