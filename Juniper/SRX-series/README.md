# General guidelines
Details on how to use the below templates to configure an Juniper MX equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Juniper MX configuration notes
## Miscellaneous useful notes
* Juniper MX devices support both RE-based sampling and inline Jflow sampling.
  * RE-based flow sampling is done on the CPU of the RE so it has the potential to affect convergence performance. This method supports Netflow v5, v8, and v9 and can do multiple collector destinations.
  * Inline Jflow is done on the FPC ASIC so the performance is much better. It supports Netflow v9 and IPFIX. More details on Inline jflow are located in Juniper's docs here: https://www.juniper.net/documentation/en_US/junos/topics/concept/inline-sampling-overview.html
* routers must persist SNMP interface IDs across reboots, this is usually done by default on MX devices
* Juniper MX default flow table size may not be large enough for some networks/environments, which will result in under-reporting in the flow data

## Adjusting Flow-table size:
The Juniper MX default flow table size may not be large enough for some networks/environments, which will result in under-reporting in the flow data. The flow table size can be adjusted in increments of 256K flows with the following configuration:
```
chassis {
  # for MX-104, use "afeb slot 0"
  fpc 0 {
    inline-services {
      flow-table-size {
        # 15 × 256K = ˜4M
        ipv4-flow-table-size 15;
      }
    }
  }
}
```
## additional config required on linecards and interfaces
The ```ipfix-interfaces.conf``` and ```ipfix-linecards.conf``` display these additionally required stanzas.
* Add this one to every active lincard:
```
chassis {
  fpc 0 {
    sampling-instance KENTIK;
  }
  fpc 1 {
    sampling-instance KENTIK;
  }
}
```
* And add this to active interfaces:
```
family inet {
  sampling {
    input;
  }
}
```


# Streaming Telemetry notes 
Currently, Streaming Telemetry is only supported for dial-in and dial-out modes for MX devices. See ```telemetry_gnmi.conf``` for the dial-in device configuration and ```telemetry_native.conf``` for the dial-out configuration. 