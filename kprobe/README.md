## Installing kprobe

1. Go to https://packagecloud.io/kentik/kprobe and find the Distro/Version for your server
2. Install the Package repository, this will allow you to upgrade to future versions leveraging your OS’ package manager. The package repository install instructions are located on the top right corner of the page of each selected package:
3. Install the package locally using your Operating Systems package manager. Example: **`sudo yum install kprobe-1.4.0-1.x86_64`**

#### Notes on `kprobe` setup
- Once installed, the package repository will allow you to perform native updates of Kprobe leveraging the chosen package managers’ update commands
- For a one-off install of KProbe without registering the package repositories, please go to this URL: https://packagecloud.io/kentik/kprobe/install#manual
- Other options are available to install KProbe and will help match your deployment habits: Chef, Puppet… instructions on how to install the repositories are also available here:
https://packagecloud.io/kentik/kprobe/install these methods can be selected in the upper right corner on that page:



## Running `kprobe`
_The following assumes that the KProbe host agent is installed and available on the server._

>**kprobe needs Root privileges to run.**
Please run one instance of kprobe per interface on the server.
If not specified in the command line, sample rate will use the one configured in the left-side portal form.
Instead of displaying the API Token in the command line below, KProbe will try and read the `KENTIK_API_TOKEN` environment variable if it is set on the server.

Run the following command to start `kprobe` on the server:
```
/usr/local/bin/kprobe --email {{current_user_email}} \
  --token {{current_user_api_token}} \
  --interface <interface_name e.g. eth0> \
  --device-name {{curr_device_name}} \
  --device-plan {{selected_plan}} \
  --sample {{configured_sample_rate}}
```

#### Optional parameters
These should be appended to the command line displayed above, remember to add a `\` at the end of each line for a multi-line command.

- **`--proxy-url http://<http_proxy_or_kproxy_IP>:<proxy-port>`**: If "Sends Flow through kProxy" is enabled.
- **`--no-decodes`**: If additional decodes are _disabled_.
- **`--http-port <one_port_per_HTTP_port_to_decode>`**: If additional decodes are _enabled_.



