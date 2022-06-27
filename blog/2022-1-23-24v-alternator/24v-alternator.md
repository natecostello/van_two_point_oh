---
type: post
section: blog
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: 24V Alternator Install
author: Nate
date: 2022-01-23
tags:
 - van
 - build
 - electrical
 
metatags:
	# no metatags
cover: 
	# image file
 img: cover.jpeg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

Reference alternator selection article (and update it).
Discuss cable selection and length, round trip run

Install
Interference removal
Bushing alignment issue - modification
Belt install difficulty details including interference with slide bushings
Final belt selection




2022-1-23
Prototyped routing for wire length and guage determination.
25 ft even, including about 3ft of margin on the ends (which will likely be shortened)

Notes from call with Jim Dunlap:

Alternator (4 pin option - provides access to more temperature data)
Bracket - Jim says is driven off the 4 groove pulley (main serpertine)
Includes belt

1-24-2022
Ordered Alternator

2-7-2022
Verified wakespeed alternator cables are ~27 ft long.

2-9-2022
Alternator and bracket arrived
Routed and secured alternator power and control wiring

Questions for APS (Dunlap)
Alternator wiring harness has two wires for temperature sense, a black and a red.  

The wakespeed cable has a two conductor superseal connector for the alternator temperature.  Is there a specific polarity for the connection between the wakespeed and the red and black alternator wires?

Questions for wakespeed/OGSS: 
Regarding the Van Wiring harrness:
What is the stator/field connector type/model?
What is the alternator temperature sense connector type/model?

3-10-22
Started install with byron
Enlarged upper bracket hole to fit over alignment bushing (could not line up both bushings AND still thread bolt)
Could not install belt - too tight
Found interference between tensioner and alternator slide bushing

3-15-22
Found 51 inch belt too long

3-16-22
50 inch belt ok
49.5 inch belt could not go on

3-18-22
Sanded bracket alt mounting surface for good electrical contact
Swapped 90mm bolts in to allow aft terminal connection.
Reinstalled interferences
Restarted and took up to 1500 RPM SAT on belt tracking
Terminated 2/0 pos and neg and installed

3-20-22
Terminated and landed Alt pos and ground on the main pos bus and ground bus.

4-23-22
Notes for phase 1 Alt:

No SEIC
No Upfitter Control Switch

TODO:
* Determine Wakespeed config - Mostly done
* Pin connector for CAN bus to DB9 for monitoring - Done
* Resolder jumpers in PiCAN to reflect standard DB9 - Done
* Pin alternator connectors - DONE
* Add engine run relay - DONE
* Add ring connectors to wakespeed harness + and - - Done
* Fab CE Logic (VHB optos to panel) - Done
* Wire CE Logic - Done
* Install Surge Arrestor - Done
* Connect Alternator Field/Stator/Temp - Done
* Install Battery Temp Sensor - Done
* Program Wakespeed - Done
* Verify Fuse in surge arrestor
* Install fuses for wakespeed and engine run - Done


Turns out the wakespeed connector for stator and field is actually a DT06-2s despite what wakespeed said in email.



6-4-22
Installed and wired optos for charge-enable
Terminated and landed wakespeed pos, ground, and shunt wiring



6-15-2022
Removed panels to allow access to engine run pre-wiring
Removed batter cover to expose access to C33-E 10 way connector
Noticed that pins 4 and pins 9 were connected together (load shed ground in and load shed ground signal out)

Per BEMM, max sinking through Engine Run - Pin 2 (GND signal) is 250mA.  Coil resistance measured on Bosch relay is 85 ohms.  Driven by Ignition - Pin 6 (12V) this will not exceed 250mA sink capability of Engine Run.

Relay Wiring - External/C33E Wiring

Pin 85 Coil+ (BLACK) - Pin 6 Ignition
Pin 86 Coil- (WHITE)- Pin 2 Engine Run
Pin 87 NO contact (BLUE) - 24V from prewire (RED)
Pin 30 return contact (RED) - signal return from prewire (BLACK)

Wired relay to C33-E harness and pre-wire, labeled everything, installed
Wired ENG RUN 24V source to prewire
Wired Wakespeed IGN (BROWN) to ENG RUN signal
Pinned Connectors on Alternator
Installed Battery Temp Sensor
Updated Cerbo Firmware