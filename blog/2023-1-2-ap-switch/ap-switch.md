2023-1-2
Installed switch and AP

Found AP cannot run off 12V
Testing found that it cuts off at ~15V
Walked voltage up to 29V slowly and observed normal operation
Plan to power AP of 24V system
Power consumption while idle at 29V is 2.32W per Riden

Switch config:
Shows up on a different subnet by default, had to follow [this](https://superuser.com/questions/1280225/switch-is-working-but-not-showing-up-on-lan-scan) loosely to access it.  Then gave it a default static IP my normal subnet, and set the router IP as its gateway.  Then I switched back to my subnet, and accessed it at the static IP I gave it.  The I turned back on DHCP and it was given a new IP address on the the correct subnet.  It doesn't show up well in openwrt but I was able to find it based on a new DHCP showing up.  In hindsight, make note of the Mac address in advance to help find it.

