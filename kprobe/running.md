## Running kprobe

**Note**: kprobe requires Root privileges to run.

- The following assumes that the kprobe agent is installed and available on the server.
- Run one instance of kprobe per interface on the server.
- Setting the `KENTIK_API_TOKEN` environment variable will replace the need for the `--token` option.

Run the following command to start kprobe on the server:

```bash
/usr/local/bin/kprobe --email {{current_user_email}} \
  --token {{current_user_api_token}} \
  --interface <interface_name e.g. eth0> \
  --device-name {{curr_device_name}} \
  --device-plan {{selected_plan}} \
  --sample {{configured_sample_rate}}
```

### Optional parameters

These should be appended to the command line displayed above. Remember to add a `\` at the end of each line for a multi-line command.

- **`--proxy-url http://<http_proxy_or_kproxy_IP>:<proxy-port>`**: If "Sends Flow through kProxy" is enabled.
- **`--no-decodes`**: If additional decodes are _disabled_.
- **`--http-port <one_port_per_HTTP_port_to_decode>`**: If additional decodes are _enabled_.
