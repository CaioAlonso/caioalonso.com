---
layout: post
title:  "Restarting fancontrol after resume from sleep/suspend"
---

Whenever I set up a new Linux system I install [lm-sensors](https://github.com/lm-sensors/lm-sensors) and enable the fancontrol utility. Most of the time fancontrol doesn't get restarted when resuming from sleep/suspend. This is how I fix this with systemd:

/etc/systemd/system/fancontrol-resume.service
```
[Unit]
Description=Restart fancontrol after resume from sleep/suspend
After=suspend.target

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart fancontrol.service

[Install]
WantedBy=suspend.target
```

Then:
```
sudo systemctl daemon-reload
sudo systemctl enable fancontrol-resume.service
```
