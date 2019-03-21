# General guidelines
Details on how to use the below templates to configure an Juniper MX equipment are displayed in the [README.md](https://github.com/kentik/config-snippets/blob/master/README.md) file at the root of this repository

# Juniper QFX/EX configuration notes
The default chosen Flow protocol for QFX and EX series is initially SFlow (us is sually the case with switching platforms).
## There are issues with Sflow on QFX platforms
The SFlow implementation on the QFX platform has suffered from a lot of issues in the past
* Netflow has been introduced on the QFX platforms in 15.1
* Sflow greatly improved on the QFX platforms starting in 18.3

Based on the above is, based on your JunOS version on QFX:
* on QFXs, for any version pre 15.1, use SFlow as it is the only available method, though suboptimal (Adaptive Sample Rate is flawed, basically)
* on QFXs, for any version between 15.1 and 18.3, please use Netflow, as descibed in the MX configuration section:
[MX configuration guide here](https://github.com/kentik/config-snippets/tree/master/Juniper/MX-series)
* on JunOS version post 18.1, Sflow has been greatly improved and can be used again (up to your preference), in which case please use this section 
* Kentik discourages the use of Adaptive Sample Rate before version 18.3 of JunOS - for versions greater or equal, the follwoing can be used:
```
adaptive-sample-rate rate {
	fallback;
}
```
## SFlow implementation on EX platforms
* Sflow presented a few crippliing issues on the EX platform prior to version 12, please make sure you are running a more recent one
* The proper Adaptive Sample Rate command set stills need to be entered (comes with version >= 12 on EX) for SFlow to work in a more acceptable manner
```
 adaptive-sample-rate rate {
         fallback;
 }
 ```