# wakeup

Wakeup is script for setting which devices can wake up your computer from sleep. 

It is very simple solution to make sure your laptop is waken up only by LID for example... (If you do not want USB mouse to wake up your laptop)

## Usage

Open wakeup.sh end edit list of devices to be enabled. 

You can see list of supported devices in **/proc/acpi/wakeup**

### Usage with systemd

Put this into **/etc/systemd/system/unsuspend.service**

```
[Unit]
Description=Unsuspend

[Service]
ExecStart=/bin/bash /path/to/wakeup/wakeup.sh

[Install]
WantedBy=sleep.target
```

Then enable it: 

```bash
systemctl daemon-reload
systemctl enable unsuspend.service
```

