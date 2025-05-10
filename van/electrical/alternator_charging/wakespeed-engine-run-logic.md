---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Wakespeed Engine Run Logic
author: Nate
date: 2022-02-13
tags:
 - 24v
 - design
 - concept
 - electrical
 - van
 - alternator
 - charging

metatags:
	# no metatags
cover: 
	# image file
# img: alternator-cover.JPG
	# if attribution is needed
	# source: [vecteezy]
	# url: url
tldr:
---

Per the wakespeed [user manual](http://wakespeed.com/WS500%20Users%20Manual.pdf), the VAN wiring harness includes a brown denoted as "ignition".

>**Ignition** – The brown 16-gauge wire in the dash leg of the wiring harness provides a switched source of power for the regulator. This wire must see at least 8.5 volts to turn the WS500 on. This wire can be connected to the ON side of the ignition switch, to an oil pressure switch, or another circuit which is only activated when the engine is running. A switched ignition wire may be available at the alternator from the engine’s wiring loom. 

Per the **Pull Back Factor (PBF)** description in the wakespeed [Communication and Programming Guide](http://wakespeed.com/Wakespeed%20%20Communications%20and%20Configuration%20Guide%20v2.4.3.pdf), the Ignition signal must not be present if the engine is not running if you use the default PBF of 0.

>Finally, if your system matches an engine with great capability, and the alternator has good cooling / heat management – you can set the PBF factor = 0 to disable any capping of field drive while the engine is at idle. This will allow for maximum alternator output at idle, however if the regulator is enabled but the engine is not actually running, field drive will increase to Full Field until a fault check causes the regulator to reset. Do not leave the ‘ignition’ in the ON position, without the engine actually running to prevent this situation. It would be advisable to assure there is a temperature sensor attached to the alternator in this case – to prevent unintended overheating during prolonged idle periods.

Al Thomason responded to a [question](https://github.com/victronenergy/venus/issues/779#issuecomment-773444558) on the ignition signal in github discussion.

>"Wakespeed only powered up when ignition is present? @thomasonw pls confirm."

>In installations to date, this is true. The Brown 'Ignition' wire must be powered to allow the WS500 to operate. However, with the (later this week?) release of firmware 2.4.0 a new option will be enabled where the Brown wire may be powered 100% of the time keeping the WS500 active at all times - and in this case the 'Ignition' is then connected to the Feature-in port to signal when the alternator should be driven.

We plan to ensure the ignition signal is only present when the engine is actually running.

There are two proven options to accomplishing this.  

Option 1 is to use the C33-E connector located under the driver seat.

[@Maia](https://www.fordtransitusaforum.com/members/maia.106950/) details her engine run logic physical install with this option [here](https://www.fordtransitusaforum.com/threads/tiny-watts-installation-experience-initial-review.87174/post-1140295).  [@PNW_Camper](https://www.fordtransitusaforum.com/members/pnw_camper.105975/) describes the electrical logic of this option [here](https://www.fordtransitusaforum.com/threads/build-thread-miracle-whip.86593/post-1138046).

This [pigtail](https://www.amazon.com/Equivalent-replacement-Pigtail-WPT-1037-1U2Z-14S411-BLB/dp/B07W99QSCD) will connect to the C33-E connector.

Note, an opto isolator could be substituted for the relay.  However we would need to confirm what the amp draw of the wakespeed is on the ignition line. Email sent.

Option 2 is to use the High Spec Interface connector located behind the glove compartment.  This method has the upside of integrating well with an upfitter switch to as a manual "enable".  The downside is the complexity of navigating the upfitter switches and routing wires from the glove compartment over to the driver seat area.

For phase 1, we'll go with Option 1.  We'll also go with the relay as there are less unknowns.  We'll consider option 2 when we have more time on our hands.