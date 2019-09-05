## Installing kprobe

1. Go to https://packagecloud.io/kentik/kprobe and find the Distro/Version for your server
2. Install the Package repository, this will allow you to upgrade to future versions leveraging your OS’ package manager. The package repository install instructions are located on the top right corner of the page.
3. Install the package locally using your Operating Systems package manager. Example: **`sudo yum install kprobe-1.4.0-1.x86_64`**

### Notes on kprobe setup

- Once installed, the package repository will allow you to perform native updates of Kprobe leveraging the chosen package managers’ update commands
- For a one-off install of KProbe without registering the package repositories, please go to this URL: https://packagecloud.io/kentik/kprobe/install#manual
- Other options are available to install KProbe and will help match your deployment habits: Chef, Puppet… instructions on how to install the repositories are also available here:
  https://packagecloud.io/kentik/kprobe/install these methods can be selected in the upper right corner on that page:
