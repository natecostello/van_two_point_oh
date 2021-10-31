---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Circuits
author: Nate
date: 2020-10-26
tags:
 - wiring
 - design
 - concept
 - electrical
 - van

metatags:
	# no metatags
cover: 
	# image file
 img: circuits.jpeg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

This article describes the power circuits planned for the van.

## Outlet, Switch, Control Locations

120VAC outlets will be in the following locations:

* Comm Area
* Garage Area
* Counter Level - Driver Side 
  * [This](https://www.farmandfleet.com/products/148585-carlon-shallow-box.html?blaintm_source=google&blaintm_medium=pla&gclid=Cj0KCQiA962BBhCzARIsAIpWEL0ZxBo7hZ6lRTTaHp_B29eZpyMVcut_WesCwzd3hvVADxaRMHoxAHIaAqlkEALw_wcB) (1.25 depth) or [This](https://www.zoro.com/cantex-electrical-box-square-pvc-ez08sf/i/G3145073/?pla=true&utm_source=google&utm_medium=surfaces&utm_campaign=shopping%20feed&utm_content=free%20google%20shopping%20clicks&gclid=Cj0KCQiA962BBhCzARIsAIpWEL3SRmi1h1tdaUfajjNUF3tNYXX8NsH1hppcAxP2JZjMDwf-0M5kTtEaAj6NEALw_wcB&gclsrc=aw.ds) (1.25 depth) could place these against bed
* Counter Level - Passenger Side
* Under Counter - Driver Side
* Under Counter - Passenger Side
* Slide Door Area

USB C Outlets will be in the following locations:

* Counter Level - Driver Side
* Counter Level - Passenger Side

12VDC Outlets will be in the following locations:

* Upper Shelf - Driver Side
* Comm Area

Heater Control will be located in/on the driver side bed side cabinet.

Max Fan Control will be located in/on the driver side bed side cabinet.

Water Pump On/Off will be located on the side of the sink cabinet, easily accessible from outside with the door open.

Gas Solenoid On/Off will be integrated into the oven on/off switch.

Light On/Off/Dim will be located on the side of the sink cabinet, easily accessible from outside with the door open.  There will also be a switch located in the bed area on the passenger side in the bed side cabinet.



## 120VAC Circuits

Based on the 30A rating of our Shorepower ELCI Breaker and the AC Main Breaker, all AC wire between the Shorepower connection and the AC Main Breaker Panel will be 12AWG triplex marine wire.  Branch circuit AC wire and AC wire between the factory-alternator-inverter will be 14AWG triplex marine wire.

**Shorepower:** The shorepower circuit will run from the outlet under the driver side rear bumper, up inside the D-pillar, forward through the driver wall void to the shorepower ELCI main breaker.  From that breaker it will tie locally to the shorepower/factory-alternator-inverter transfer switch.  The transfer switch will then tie to the AC input power connection on the Multiiplus 24/3000.  The round trip length is ~12 ft.

**Factory-Alternator-Inverter:** The factory-alternator-inverter circuit will run from the inverter location, forward of the freezer cabinet, aft through the driver wall void to the transfer switch adjacent to the AC Main Panel.  Round trip length is:

**Branch Circuit:** The branch circuit will run from the AC Main Panel, aft through the driver wall void, to a GFCI outlet in the driver side rear garage, forward through the driver wall void, to an outlet inside the aft most driver galley cabinet, up to an outlet in the driver bed/counter region, down to the driver wall void, up and inside the C-pillar, across the C-pillar roof beam, down and inside the passenger C-pillar, into the passenger wall void, to an outlet inside the aft most passenger galley cabinet, up to an outlet in the passenger/counter region, down through the passenger galley to an outlet on the side of the sink cabinet.  The round trip length is:


## 24VDC Circuits

**Water Pump:** The Water Pump is a Shurflo Aqua King II Supreme 5.0.  Shutoff current is 6A at 25.6V.  Open flow current is 2A at 25.6V.  The pump will be located in the sink cabinet.  The feed and return will run from the 24V electrical panel up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column and into the sink cabinet.  Estimated round-trip length is XX ft.  Wire gauge is:

**Fridge and Freezer:** The Fridge and Freezer combined are 83W, corresponding to ~3.5A at 24V.  They will share a circuit.  The feed and return will run from the 24V electrical panel, forward through the driver wall void, and into the fridge cabinet (where the fridge and freezer compressor are located).  Estimated round-trip length is XX ft.  Required wire gauge is:


**Air Compressor:** The onboard air system will notionally us a Viair 400C compressor with a peak draw of 12A.  Based on the wire diagram for the dual compressor configuration, separate relays are controlled by the pressure switch, thus separate feeds from the power source are fine.  Thus we assume 12A and will add a second wire run for a dual system if desired down the road. The feed and return will run from the 24V electrical panel forward through the driver wall void, though the C-pillar, down through a wall void floor cut, under the van along frame and to the passenger rear corner.  Estimated round trip length is XX ft.

Based on the wire gauge guide in the manual, it roughly follows the ABYC Non-Critical (10%) voltage drop guidance. 

Required wire gauge is: 

**USB Outlets:** USB outlets will be located PORT and STBD at the foot of the bed/start of counter.  Each side will have a bluesea below deck panel, modified with a 24V breaker, and will house two double-USB sockets.  The USB PD spec allows for power up to 100W via USB-C.  We will assume this standard, which would require 200W at each outlet location.  This corresponds to 8.3A each, thus they will each have their own circuit.

The driver feed and return will run from the 24V electrical panel up to the outlet.  Estimated round trip length is XX ft.

The passenger feed and return will run from the 24V electrical panel forward through the driver wall void, up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column, aft through the passenger wall void, and up to the outlet.  Estimated round trip length is XX ft.

Required wire gauge (using limiting case) is:

__Note: The USB PD 3.1 spec allows for power up to 240W via USB-C.  The cable requirements to supply two 240W sockets at 24V is excessive (8AWG or greater).__

**LED Strip Lights:** Four runs of LED strip lighting will run fore-aft in the van along the ceiling and walls.  [This Govee package](/van/functional/lighting/lighting) is the preferred option.  Power for the full length is 60W corresponding to 2.5A.  Notionally, the one switch will be located on the side of the sink cabinet near the entry way.  Another switch will be located on one side of the bed.  The dimmer/control will be located adjacent to the switch by the bed.  Feed and return will run from the 24V electrical panel, forward through the driver wall void, up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column, out and up to the switch on the forward side of the sink cabinet.

Estimated round trip length is XX ft. Required wire gauge is about anything based on the low current draw.

**Reading Lights:** The two reading lights will be located in the rear overhead pillar.  The feed and return will be run from the electrical panel aft through the driver wall void, up and inside the D-pillar and to the overhead rear pillar.  Estimated round trip length is XX ft.

Required wire gauge is:


**Exterior Lighting:**  Exterior lighting will be handled in the future.  It will probably consist of four separate circuits (Front, rear, PORT, STBD).

**Interior Fans:** The two Sirocco II fans combined are ~12W corresponding to ~0.5A at 24V.  They will share a circuit.  The feed and return will run from the 24V electrical panel, up to the driver fan, down, forward through the driver wall void, up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column, aft through the passenger wall void, and up to the passenger fan.  Estimated round-trip length is XX ft.  Required wire gauge is:

**Propane Solenoid:** The propane solenoid load is ~20W corresponding to ~0.8A at 24V.  The feed and return will run from the 24V electrical panel up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column and into the stove cabinet to a relay, from the relay into the passenger wall void, though a wall void floor cut, under the van along the frame to the propane tank behind the rear differential.  Estimated round-trip length is XX ft.  Required wire gauge is:

## 12VDC

**Communication/Computation:**  These loads are all local to the 12V fuse block such that their wiring will not be factored into any bulk cable purchase/size determination.

**Heater:** The B4L max load is <= 100W corresponding to ~8A at 12V.  The feed and return will run from the 12V fuse block aft through the driver wall void, to the heater just aft of the driver rear wheel.  Estimated round trip length is XX ft.  Required wire gauge is:

**MaxxFan:** The MaxxFan load is ~38W corresponding to ~3A at 12V.  The feed and return will run from the 12V fuse block aft though the driver wall void, up inside the D-pillar, across the D-pillar roof beam to the fan.  Estimated round trip length is XX ft.  Required wire gauge is:

**Outlets (Driverside Overhead Shelf):**  This cable run will be for future expansion.  We may elect to convert to 12V on location.  We also may elect to hardwire vs using outlets.  In either case, assume 200W load.  The feed and return will run from the 12V fuse block forward though the driver wall void, up and inside the C-pillar, forward through the upper driver wall void to the overhead shelf region.  Estimated round trip length is XX ft.  Require wire guage is:

**Oven:** The oven max load is not listed in the manual but is expected to be minimal (LEDs, sparkers, and relay modification) and bounded by any other 12V components.  The feed and return will run from the 12V fuse block up and inside the driver C-pillar column, across the C-pillar roof beam, down and inside the passenger C-pillar column and into the stove cabinet.  Estimated round trip is XX ft.  Required wire gauge is:



