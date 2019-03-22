# General guidelines
Details on how to use the below templates to configure a Juniper MX equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Juniper QFX/EX configuration notes
The default chosen flow protocol for QFX and EX series is initially sFlow
## Be aware that sFlow on QFX platforms is not perfect
* On some older code, sFlow is the only export protocol available. This works, but on particularly busy devices, the adaptive sampling backoff algorithm is not implemented, so flow sampling rates will increase until the device is reset. Contact support@kentik.com to discuss workarounds.
* QFX 1000X platforms support IPFIX in code 17.3 and newer. It is recommended that customers upgrade to this version of code to avoid the adaptive sampling bug discussed previously 
* sFlow support for adaptive sampling is greatly improved on the QFX platforms starting in 18.3

Based on the above is, based on your JunOS version on QFX:
* On the QFX platform, for any version prior to 17.3, use sFlow as it is the only available method
* On QFX 1000X switches, for any version between 17.3 and 18.3, please use IPFIX, as described in the MX configuration section:
[MX configuration guide here](https://github.com/kentik/config-snippets/tree/master/Juniper/MX-series)
* on JunOS version post 18.1, sFlow has been greatly improved and can be used again (up to your preference), in which case please use this section 
* Kentik discourages the use of Adaptive Sample Rate before version 18.3 of JunOS - for versions greater or equal, the following configuration can be implemented in order to make the sample-rate reset to the configured values:

```
adaptive-sample-rate rate {
    fallback;
}
```

## SFlow implementation on EX platforms
* Sflow presented a few crippling issues on the EX platform prior to version 12, please make sure you are running a more recent software version
* The proper Adaptive Sample Rate command set stills need to be entered (comes with version >= 12 on EX) for sflow to work in an acceptable manner:

```
 adaptive-sample-rate rate {
         fallback;
 }
 ```
