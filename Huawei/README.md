# General guidelines
Details on how to use the below templates to configure an Arista equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Huawei configuration notes
## Interface index in flows
Prior to version 5 of VRP (version <= 5), Huawei routers will store an Interface index in flows that doesn't match the ifIndex from the SNMP polls.
There are two distinct cases, described below.
### VRP versions <= 5
For these versions, the Interface Index stored in the flows for SOURCE interface and DESTINATION interfaces uses a 16bit counter.
SNMP interface IDs use a 32bit index.
*Kentik Detect* will automatically compensate for that and convert the 16bit indices into 32bit.
### VRP versions >=5
In these versions, users can actually configure what format the flow engine is going to use to store Interface Indices.
Please make sure you use the following command:
```ip netstream export index-switch 32```
This way the flows will properly store Interface Indices as a 32bit index.
