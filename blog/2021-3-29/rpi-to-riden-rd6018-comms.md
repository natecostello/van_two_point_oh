---
type: post
section: blog
categories: 
 # one or more categories is permittedtypora-root-url
 - electrical
navTitle: 
title: RPi to Riden RD6018 Comms
author: Nate
date: 2021-03-29
tags:
 - van
 - electrical
 - test
 - tools
metatags:
	# no metatags
cover: 
	# image file
 img: rpi-to-riden-rd6018-comms.jpg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

### Why bother getting an RPi talking to a Riden RD6018

Why? Because you can script and automate testing.  Why an RPi? Because I don't trust hooking up my prized laptop to unknown equipment.  Thats about it.  It required a little poking around and some familiarity with the command line.
### Getting an RPi talking to a Riden RD6018

After messing around, this is the straight path that got a headless RPi talking to the RD6018:

1. Install a clean Raspian Lite image using [Raspberry Pi Imager](https://www.raspberrypi.org/software/).  CTRL+SHIFT+X to preconfigure the image for SSH and wifi.

2. Boot up, find the RPi's IP, and SSH in.  Note, some of the following commands will require sudo, but I wasn't paying close attention.

3. ```apt update```
4. ```apt upgrade```
5. ``` apt install git``` (Raspian Lite doesn't come with it)
6. ```apt-get install raspberrypi-kernel-headers``` (This was needed to *make* in the following steps)

7. ```git clone https://github.com/natecostello/CH341SER.git``` (This is the RIDEN USB Linux Driver)

8. ```cd CH341SER/```

9. ```make```

10. ```make load```

11. ```cd ~```

12. ```apt install python3-pip```

13. ```pip3 install -U minimalmodbus```

14. ```git clone https://github.com/natecostello/rd6006.git```

15. ```cd rd6006/```

16. ```python3 setup.py install --user```

17. Connect the RD6018 to the RPi, and power it up

18. ```python3 -m serial.tools.list_ports``` 

```shell
/dev/ttyAMA0        
/dev/ttyUSB0 
```

19. ```python3```

```
>>> from rd6006 import RD6006
>>> r = RD6006('/dev/ttyUSB0')
RD6012 or RD6018 detected
>>> r.status()
== Device
Model   : 6018.1
SN      : 00004257
Firmware: 1.34
Input   : 68.0V
Temp    : 29°C
TempProb: 21°C
== Output
Voltage : 5.0V
Current : 0.0A
Energy  : 0.0Ah
Power   : 0.0W
== Settings
Voltage : 5.0V
Current : 18.1A
== Protection
Voltage : 62.0V
Current : 18.2A
== Battery
Capacity: 0.0Ah
Energy  : 0.0Wh
== Memories
M0:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M1:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M2:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M3:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M4:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M5:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M6:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M7:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M8:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
M9:  5.0V, 18.100A, OVP:62.0V, OCP:18.200A
```

20. Woo