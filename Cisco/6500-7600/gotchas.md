*Notes:*
* SNMP configuration requires ifIndex persistence upon reboot to be enabled, as it isn't by default.
* when configuring a Cisco 6500/7600 l3 switch, layer-2 traffic between ports on the same VLAN is not exported as NetFlow until it becomes layer-3 switched/routed
* further details available in Cisco Documentation on netflow: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst6500/ios/12-2SX/configuration/guide/book/nde.html#wpxref81329