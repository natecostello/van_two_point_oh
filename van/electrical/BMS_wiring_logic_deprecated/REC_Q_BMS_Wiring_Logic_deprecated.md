---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: REC Q BMS Wiring
author: Nate
date: 2020-10-26
tags:
 - BMS
 - battery
 - design
 - concept
 - electrical
 - van
 - deprecated

metatags:
	# no metatags
cover: 
	# image file
	# img: img
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---
# REC Q BMS Wiring Logic
![REC Q BMS Wiring Logic](REC_Q_BMS_Wiring_Logic_deprecated.svg)
## Operation

**ON**

[REC Q BMS](http://www.rec-bms.com/datasheet/UserManual_REC_Victron_BMS.pdf) is always attached, Internal relay is normally closed. When Remote Switch (RS) is closed, Vbat is applied through internal relay, through RS, to [REC PRE-CHARGE](http://www.rec-bms.com/datasheet/UserManualPrechargeNew.pdf) (RPC) BMS+ Input. RPC Applies VBat via 66 ohm relay to load side of contactor via System + connection for x seconds. After x seconds, RPC energizes Contactor - via an open collector, and will continue to do so. This signal is applied continuously to the Input of the [REC Bi-Stable Latching Relay Driver](http://www.rec-bms.com/datasheet/UserManual_BSLRD.pdf) (RBSLRD). Upon first application, the RBSLRD will produce a 100 msec GND pulse on Set Relay Coil -. This signal is inverted by the [RBLSRD inverter](REC_BSLRD_inverter.md) to a 100 msec Vbat signal that is applied to the [BlueSea Remote Battery Switch](http://assets.bluesea.com/files/resources/instructions/980035680-001-7701100-7703100.pdf) (RBS) CLOSE input, which closes the RBS contactor. 

**OFF**

When the RS is opened, or the REC Q internal relay is opened*, Vbat is removed from the RPC BMS+ input. The RPC will float its Contactor - output and continue to do so. When the RBSLRD Input pin floats, the RBSLRD will produce a 100 msec GND pulse on Reset Relay Coil -. This signal is inverted to a 100 msec Vbat signal that is applied to the RBS OPEN input, which opens the RBS contactor.



**\*The following events result in the REC Q Internal Relay opening**

Cell Voltage High (cell over voltage switch-off + hysteresis)

Cell Voltage Low (cell under voltage protection switch-off + hysteresis)

Cell Temp High (cell over temp switch-off + hysteresis) 

Number of cells or BMS address is not set properly

Temperature sensor error (connection problem)

Cell Short Circuit or BMS measurement error

Main Relay is in short circuit

Current measurement disabled or > 2x shunt max current

Wrong Cell Chemistry Selected

Cell balancing or measurement failure

BMS internal comm failure

**Note:** The internal relay is NOT opened under Temperature Low (under temperature charging disable + hysteresis) conditions.  We will use charger enable signal to provide hardware backup protection of low temperature charging under loss of CAN conditions.



## Over Voltage Backup Protection

This is accomplished by the disconnection of the Main Contactor by the BMS via its internal relay.



## Under Voltage Backup Protection

This is accomplished by the disconnection of the Main Contactor by the BMS via its internal relay.



## Low Temp BackUp Protection

This is accomplished by disabling each charging source by the BMS via its charger enable opto-coupler.

### MPPT

From the 150/XX MPPT Manual

> **3.5 Remote on-off** 
>
> The left terminal is connected to the internal 3,3V supply, with a resistor in series for short circuit protection. The right terminal (marked as + or marked as H) will switch the controller on if >3V is applied, and will switch the controller off if <2V is applied or if the terminal is left free floating. The recommended use of the remote on-off is: 
>
> a. A switch wired between the left and right terminal 
>
> b. A switch wired between battery plus and the right terminal. 
>
> c) A switch between the right terminal and the charge disconnect terminal of a VE.Bus BMS

The REC documentation describes the charger enable as open collector and open emitter, and also as an opto-coupler.  Based on this, wire the left terminal of the MPPT to BMS Charger Enable (1), and wire the right terminal of the MPPT to the BMS Charger Enable (2).  This will provide fail safe remote shutdown (ie wire becomes disconnected and floats right terminal of MPPT will shut down).

### Multiplus

One possibility is to use the Charge current control assistant

**Another possibility is to use the Two-signal BMS support assistant.**   Select "The BMS has one contact which which switches only on a high-cell condition".   Then "The battery is full when [Aux1/Aux2] is [open/closed]".  Lastly "[Disable Charger] and [do not adapt SOC] when battery full."  This could use the REC charger enable opto-coupler, but not in parallel with the MPPT.   Thus we need to branch the REC signal.

### Alternator/Wakespeed

From the [Wakespeed WS500 Quickstart Card](http://wakespeed.com/Quick%20Start.pdf):

> **Feature In Wire (White)** Can be connected to a voltage source greater than 8.5 VDC to enable a range of selectable optional capabilities as detailed in the User’s Guide

From the [Wakespeed WS500 Quickstart Guide](http://wakespeed.com/WS500quickstartguide.pdf):

>**Function In –** The white 16-gauge Function In can be configured to provide a number of custom controls which can be activated by connecting the wire to >8.5VDC+ via a toggle or other ON/OFF type switch. In default mode, the Function In mode will enable equalize mode when the regulator is configured for lead acid batteries. When the WS500 is configured for LiFeP04 batteries (see DIP switch instructions), Function In will force the system to float.

The wakespeed in stand-along mode can be made to enter a Post-Float mode in which the charger is off but monitoring or a return to bulk.  In the [Wakespeed Configuration Utility Guide](http://wakespeed.com/CU/ConfigurationUtilityGuideWeb.pdf) by configuring the "Exit Duration" of the $CPF entry to a small non-zero number like '1' (looks like minutes), the WS500 will quickly exit float.  By configuring the "Exit Duration" of the $CPE entry to zero, equalization will be disabled.  The $CPP entry is used to configure Post-Float behavior.  Fully disabling the charger, and setting a Battery Voltage corresponding to a return to Bulk is possible.  

TODO: This needs verification, but it appears that by custom configuring the Custom Profiles as identified above, on loss of CAN, that profile, selected by DIP switches, is used.  That behavior in conjuction with the **Feature In** would allow the BMS charger enable signal to disable alternator/Wakespeed charging.

TODO: Determine if **Function In** is active high or low.  Specifically, if >8.5V is present, does it force to float, or force to float when >8.5V is not present.

TODO: Determine which ground the **Function In** is referenced to.  Determine max input current draw of **Function In**.

### All Together

TODO: Since we need separate dry contacts or opto-couplers for two components, we will need a "splitter".  A starting place would be [this sparkfun opto-isolator breakout](https://www.sparkfun.com/products/9118).  TODO: Since we need a >8.5v DC 'wet' signal we will also need some conditioning.  Could possibly use the RBSLD inverter.

