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

metatags:
	# no metatags
cover: 
	# image file
 img: rec-bms.jpeg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

![REC Q BMS Wiring Logic](REC_Q_BMS_Wiring_Logic.svg)

## Connection Notes

The [Blue Sea 7717 Remote Battery Switch](blue-sea-7717-rbs.pdf) speecifies 16 AWG wire minimum for control connections.  It also specifies 4/0 wire to handle 300A continuous current.

## Operation

**ON**

[REC Q BMS](http://www.rec-bms.com/datasheet/UserManual_REC_Victron_BMS.pdf) is always powered, Internal relay is normally closed*. When Blue Sea 2155 Remote Control Switch (RS) is closed (PIN 2 connected to PIN 3), Vbat is applied through the RS, through the internal relay, to [REC PRE-CHARGE](http://www.rec-bms.com/datasheet/UserManualPrechargeNew.pdf) BMS+ Input. REC PRE-CHARGE Applies VBat via 66 ohm relay to load side of contactor via System + connection for a preset delay. After the preset delay, REC PRE-CHARGE "energizes" the Blue Sea 7717 Remote Battery Switch (RBS) to close the RBS main contactor. After one second, application of power via System+ is removed and all power flows to the system via the RBS main contactor.  

Note, REC PRE-CHARGE manual states:
>The pre-charge unit closes the power circuit through its internal relay (RELAY ON). The inrush current flows entirely through the pre-charge 66 Ω internal resistor. After 4 seconds the transient current should be approximately zero. The pre-charge energizes the contactor coil through open collector circuit and after 1 second opens the internal relay (RELAY OFF).

It is not 100% clear that the RBS will operate correctly with the REC PRE-CHARGE due to it's use of open collector (i.e., application and removal of GND) operation.  We will have to test.  What is clear is that the Flashing LED functionality associated with manual ON overide will not work since the RBS will not have access to GROUND provided by the REC PRE-CHARGE in that condition.  To regain this, and to mitigate concerns with open-collector control, we may insert and opto-islator.

<details>
<summary>Opto-Isolated Variant</summary>

![REC Q BMS Wiring Logic Opto](REC_Q_BMS_Wiring_Logic-opto.svg)

</details>  
  
  

**OFF**

When the RS is opened, or the REC Q internal relay is opened*, Vbat is removed from the REC PRE-CHARGE BMS+ input. The RPC will float its Contactor- output continuosly which deenergizes the main contactor coil and opens the main contactor.

**\*The following events result in the REC Q Internal Relay opening:**
* Cell Voltage High (cell over voltage switch-off + hysteresis
* Cell Voltage Low (cell under voltage protection switch-off + hysteresis)
* Cell Temp High (cell over temp switch-off + hysteresis) 
* Number of cells or BMS address is not set properl
* Temperature sensor error (connection problem)
* Cell Short Circuit or BMS measurement error
* Main Relay is in short circuit
* Current measurement disabled or > 2x shunt max current
* Wrong Cell Chemistry Selecte
* Cell balancing or measurement failure
* BMS internal communication failure

**Note:** The internal relay is NOT opened under Temperature Low (under temperature charging disable + hysteresis) conditions.  We will use charger enable signal to provide hardware backup protection of low temperature charging under loss of CAN conditions.



## Over Voltage Backup Protection

This is accomplished by opening the main contactor by the BMS via its internal relay.

## Under Voltage Backup Protection

This is accomplished by opening the main contactor by the BMS via its internal relay.

## Low Temp BackUp Protection

This is accomplished by disabling each charging source by the BMS via its charger enable opto-coupler.  The REC documentation describes the charger enable as open collector and open emitter, and also as an opto-coupler.  While this could be directly connected to a single component (e.g. MPPT), because it has to control mutliple devices, this signal should drive a relay or relays that will intern signal the component.

[These relay pcbs](https://www.amazon.com/HiLetgo-Channel-Module-Isolation-Support/dp/B00LW2H5GC?ref_=ast_sto_dp) could be used to drive the MPPT and Multiplus from the BMS charge enable opto-coupler.  A pure opto-isolator approach could use [these ICStatioin 12V boards](https://www.amazon.com/dp/B01L1OI1HC/ref=emc_b_5_t?th=1).  Note, as sold, R1 (the input resistor) is 1K and R2 (the output resistor) is 10K.  ~~To use as below would want to lower R2 to about 1K.  Alternatively, could configure for an inverted (active low) feature-in signal.~~  Based on an 3-22-2022 email with support@wakespeed, the feature in line will sink 3ma with a 24V input.  This places its input impedance at 8KOhm.  Based on this new information, can use the opto isolator as is.

![currrent-plan](charge-enable-splitting.svg)
_This is our current plan for charge-enable._

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

Connecting a NO relay between the left and right terminal that is energized (CLOSED) when the charger enable signal is provided by the BMS will provide low temp backup protection that is also protected from a broken wire.

### Multiplus

One possibility is to use the Charge current control assistant.

**Another possibility is to use the Two-signal BMS support assistant.**   Select "The BMS has one contact which which switches only on a high-cell condition".   Then "The battery is full when [Aux_X] is [open/closed]".  Lastly "[Disable Charger] and [do not adapt SOC] when battery full."  Selecting "battery is full when [Temp_Sense] is [**open**]" and connecting [Temp_Sense] to a NO relay that is energized (CLOSED) when the charger enable signal is provided by the BMS will provide low temp backup protection that is also protected from a broken wire.

Note: The Multiplus Compact only has a temperature sense input, no aux inputs.  Low Temp BackUp protection will depend on being able to use this temperature sense input to support a charge enable control via the assistant.  I have [asked the question here](https://community.victronenergy.com/questions/76757/can-the-multiplus-compact-temperature-sense-input.html).  If the response is negative, I will likely shift the 3KVA Multiplus inspite of its additional parasitic load (20W vs 11W) and slightly higher cost. UPDATE: We ultimately selected the 3KVA Multiplus for flexibility.

### Alternator/Wakespeed

The wakespeed does have its own battery temperature sense that can be used to limit low temperature charging with programmable setpoints.  Importantly, it will override any outside direction based on its own sensor.  From the [Wakespeed WS500 Communication and Configuration Guide](http://wakespeed.com/Wakespeed%20%20Communications%20and%20Configuration%20Guide%20v2.3.0.pdf):

>**Min Charge Temp:**  If the battery drops below this temperature, charging will be disabled. Once temperature rises above Min Charge Temp, a new charge cycle will start. 

>**Max Charge Temp:**  If the battery reaches this temperature, the system will be disabled to protect it. If the battery temperature continues to rise, the system will eventually FAULT when battery temperature exceeds Max Charge Temp by 20%. 

>Note that Min and Max Temp limits will override any outside direction the WS500 regulator received; even if a CAN connected BMS is asking for charging, if either of these hard stop limits are exceed the regulator will enter Disabled mode.

Also important is its response to loss of sensor and loss of comms:

> **BTemp:** Measured temperature of NTC sensor attached to B-port in degrees C or battery temperature received via external CAN sensor. -99 indicates temperature has not been measured, NTC sender has failed, not attached, and there is no remote temperature information available via the CAN connection.

However, if backup protection coordinated by the BMS is desire, the method below could also be used.

From the [Wakespeed WS500 Quickstart Card](http://wakespeed.com/Quick%20Start.pdf):

> **Feature In Wire (White)** Can be connected to a voltage source greater than 8.5 VDC to enable a range of selectable optional capabilities as detailed in the User’s Guide

From the [Wakespeed WS500 Quickstart Guide](http://wakespeed.com/WS500quickstartguide.pdf):

>**Function In –** The white 16-gauge Function In can be configured to provide a number of custom controls which can be activated by connecting the wire to >8.5VDC+ via a toggle or other ON/OFF type switch. In default mode, the Function In mode will enable equalize mode when the regulator is configured for lead acid batteries. When the WS500 is configured for LiFeP04 batteries (see DIP switch instructions), Function In will force the system to float.

The wakespeed in stand-along mode can be made to enter a Post-Float mode in which the charger is off but monitoring or a return to bulk.  In the [Wakespeed Configuration Utility Guide](http://wakespeed.com/CU/ConfigurationUtilityGuideWeb.pdf) by configuring the "Exit Duration" of the $CPF entry to a small non-zero number like '1' (looks like minutes), the WS500 will quickly exit float.  By configuring the "Exit Duration" of the $CPE entry to zero, equalization will be disabled.  The $CPP entry is used to configure Post-Float behavior.  Fully disabling the charger, and setting a Battery Voltage corresponding to a return to Bulk is possible. 

Alternatively, by setting the voltage parameter in $CPF to 0.0, the charger will remain in "float" but with charging disabled until it is triggered back into a bulk charge state (e.g. by low battery voltage).  This would only be applicable in a loss of CAN situation.  Need to consider how coordinated with BMS charge enable by way of Feature-In.

In any case, it will be desirable to implement safe behavior that occurs on a loss of CAN.  We will want a fall back standalone profile that eliminates float, and utilizes a very conservative charge profile (low bulk cutoff), if any charging at all.

TODO: This needs verification, but it appears that by custom configuring the Custom Profiles as identified above, on loss of CAN, that profile, selected by DIP switches, is used.  That behavior in conjuction with the **Feature In** would allow the BMS charger enable signal to disable alternator/Wakespeed charging.

TODO: Determine if **Function In** is active high or low.  Specifically, if >8.5V is present, does it force to float, or force to float when >8.5V is not present.  Based on a close read, and the github issue below, I believe this is active high, and will force to float when it is high.  UPDATE: $SCO can be used to set whether Feature/Function in is active HIGH or LOW.

TODO: Determine which ground the **Function In** is referenced to.  Determine max input current draw of **Function In**.

NOTE: [This Github Issue related to Victron-Wakespeed integration is relevant to **Feature In.**](https://github.com/victronenergy/venus/issues/779)

### All Together

TODO: Since we need separate dry contacts or opto-couplers for two components, we will need a "splitter".  A starting place would be [this sparkfun opto-isolator breakout](https://www.sparkfun.com/products/9118).  TODO: Since we need a >8.5v DC 'wet' signal we will also need some conditioning.  Could possibly use the RBSLD inverter.

Regarding Wakespeed-REC-Victron Comms.  [Rick at OGSS](https://www.offgridsoftwaresolutions.com/ws500-user-forum/topic/victron-ve-can-and-canbus-to-ws500/#postid-434https://www.offgridsoftwaresolutions.com/ws500-user-forum/topic/victron-ve-can-and-canbus-to-ws500/#postid-434) says:
>You should be able to connect your Multi to a VE.bus

>Connect your REC BMS to the VE.CANBus port 1

>Connect your WS500s in series to VE.CANBus port 2, with a terminator plugged into your last WS500

This suggest that REC has a terminator resistor in it.  This also means we need a WS500 Victron Crossover Cable (WS-VE-CABLE), and a REC to victron CAN adapter cable.  We have both of these. 