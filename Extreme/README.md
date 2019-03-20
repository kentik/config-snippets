# General guidelines
Details on how to use the below templates to configure a Foundry/Brocade/Extreme equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Extreme(Foundry/Brocade) config notes
* on Foundry gear, there is no Ingress vs Egress options
* traffic on sflow fowarding interfaces are exclusively examined on Ingress
* each sflow fowarding interface needs the following config statement:
```sflow-forwarding```
