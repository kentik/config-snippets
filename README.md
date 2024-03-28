# Kentik device configuration snippets repository
Public repository that contains all available config snippets Kentik users can leverage to configure their networking equipments to export data to Kentik.
## What is this repository used for:
This collaborative repository is intended to support Kentik customers needs to configure their devices to export flow/snmp/bgp to Kentik's ingest platform.
It can be used in two ways:
* these config snippets are leveraged in the Kentik Portal UI at device creation time to suggest configuration snippets based on the user's choice of device vendor and model
* these are also made available to Kentik Users to:
  * lookup configuration items for their networking devices outside of the onboarding process. These can be fetched using the github Raw endpoints, for example: https://raw.githubusercontent.com/kentik/config-snippets/master/Juniper/MX-series/ipfix.conf
  * users can contribute gotchas or new devices that aren't yet in the repository
* Only Kentik Admins should be allowed to push config snippet changes to Master, users should submit pull requests to be reviewed by Kentik staff.
## Using templates outside of the device onboarding UI
In order to use these templates outside of the onboarding UI, users should copy paste their content in the device's configuration CLI. Users should ensure to read any gotchas listed in the README.md file of any configuration directory.
These configuration snippets are provided as-is, meaning some entries may sometimes (as rarely as possible though) cause an error, lookout for these and please use github issues to report them to Kentik Admins.
To understand what each template describes, please refer to the next section of this README.

# Guidelines
* Files are organized in this directory structure
  * [Vendor] > ([Product Line]) > [Model]
* For each device model, multiple config files need to be present
  * *Network flow configuration:* ```<flow_protocol>.conf```: netflow-9.conf, netflow-5.conf, ipfix.conf, sflow.conf ...
  * *Network flow configuration in case the Kentik Flow Proxy Agent is used:* ```<flow_protocol>-agent.conf```: netflow-9-agent.conf, ipfix-agent.conf ...
  * *Streaming Telemetry configuration based on the type of telemtry support and whether there the Kentik Flow Proxy Agent is used: telemetry:* telemetry_gnmi.conf, telemetry_native.conf, telemetry_native-agent.conf, telemetry_dialout.conf, telemetry_dialout-agent.conf ... 
  * *Additional per interface config for Network Flow:* ```<flow_protocol>-interfaces.conf```: Corresponds to commands that need to be added to each IP interface exporting netflow
  * *SNMP flow configuration:* ```snmp.conf```
  * *BGP configuration:* ```bgp.conf```
  * *Flowspec configuration:* ```flowspec.conf```
* Each device directory can contain a markdown file called gotchas.md that contains gotchas for this specific device
* Config snippets contains rudimentary templated variables:
  * ```{{variable}}``` get replaced by values entered by the user in Kentik Portal when configuring the device
  * ```<variable>``` will display "variable" in a highlighted manner, for instance for instances of config items users usually provide naming for
* Each vendor root directory contains a 200px width transparent png logo for the associated vendor

# Templating guidelines
Since the UI doesn't currently include any Kentik Flow Proxy registration process, the UI doesn't know about which IPs the user will be sent to. 
Therefore, there need to be two separate config templates for cases with and without agent. In the ```*-agent.conf``` config snippet, we can't reference ```{{variable}}``` types of variables because they're not present in the UI for rendering.
For this reason, the agent related templates shall include ```<variable>``` types of markers instead of ```{{variable}}``` ones.

## List of used template markups
* ```{{kentik_ingest_ip_from_UI}}```: refers to the IP given by Kentik Portal for the device to export their flows to
* ```{{kentik_ingest_UDP_port_from_UI}}```: refers to the port displayed in Kentik Portal device creation that is used to send network flows to in relation to the previously stated IP address
* ```{{device_sample_rate}}```: sample rate the user is configuring on their device and has also entered in the Kentik Portal UI during device creation
* ```{{device_sending_ip}}```: refers to the 1st IP entered in portal device configuration form in the sending ip section of the flow configuration
* ```{{kentik_portal_ASN}}```: Kentik's user ASN, routers configured to export to Kentik will be peered with the Kentik Platform with *iBGP*, and the platform's BGP ingest needs to be a *route reflector client*
* ```{{kentik_UI_bgp_peering_ipv4}}```: refers to the peering IP on the Kentik BGP ingest platform that the device needs to establish an IPv4 session with
* ```{{kentik_UI_bgp_peering_ipv6}}```: refers to the peering IP on the Kentik BGP ingest platform that the device needs to establish an IPv6 session with
