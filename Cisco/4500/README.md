# General guidelines
Details on how to use the below templates to configure an IOS-XE running equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

For more details from Cisco's documentation, visit: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst4500/15-1-2/XE_340/configuration/guide/config/fnf.html

# Troubleshooting commands:

show flow monitor cache format table

show flow exporter

show flow exporter statistics

# Known caveats:
* Supervisor Engine 7-E, Supervisor Engine 7L-E, and Catalyst 4500X support a 100,000 entry hardware flow table. The hardware flow table is shared by all the flow monitors on a switch. To prevent one monitor from using all the flow table entries, the number of entries that it uses on a switch can be limited by the cache entries number command. This limit is per flow monitor, irrespective of the number of targets it is attached to.

* 64 unique flow record configurations are supported.

* 14,000 unique IPv6 addresses can be monitored.

* Selection of Layer 2 and Layer 3 packet fields in a single flow record definition is disallowed. However, ingress 802.1Q VLAN Id of packet and Layer 3 packet field selection is allowed.

* To attach a monitor to port or port-vlan targets, a flow record matching on ingress 802.1Q VLAN Id as the key field, must also match on the input interface as the key field.

* Supervisor Engine 7-E, Supervisor Engine 7L-E, and Catalyst 4500X do not support predefined records like traditional routers (record netflow ipv4 original-input).

* Supervisor Engine 7-E, Supervisor Engine 7L-E, and Catalyst 4500X do not support flow based sampler.

* 2048 Flow monitors and records are supported.
