---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Main Contactor
author: Nate
date: 2020-12-29
tags:
 - main contactor
 - design
 - concept
 - electrical
 - van

metatags:
	# no metatags
cover: 
	# image file
	# img: img
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

# Main Contactor

**TLDR:** We selected the [Blue Sea ML-RBS 7717](https://www.bluesea.com/products/7717/ML-RBS_Remote_Battery_Switch_with_Manual_Control_Auto-Release_-_24V).



### Latching Contactor

The Latching Contactor (that behaves as a NO Contactor) under consideration is the [Blue SEA ML-RBS 7717](https://www.bluesea.com/products/7717/ML-RBS_Remote_Battery_Switch_with_Manual_Control_Auto-Release_-_24V)

Power usage is 0.013A * 24V = 0.312W

Max Voltage = 32

10,000 at 24V and 150A*

Continuous Rating 2/0 225A

Continuous Rating 4/0 300A

Cost $200 (Amazon)

*This should be good enough.  Manual interrupt will occur at low current as a matter of practice.  Un-planned loaded interrupt will generally be at :

* cell OV conditions under charge, which should be low current as managed by the BMS.

* cell UV conditions under discharge, which should be well under 150A even with a fully loaded multiplus compact (~75A).

Based on some second hand discussion with Blue Sea, this device will also function as a manual battery disconnect.

>**Me:** what I’d like to know is if the manual switch will physically open (ie break welded contacts) or is it just a secondary soft control...any idea?

>**[@Van Gogh](https://www.fordtransitusaforum.com/members/van-gogh.89410/):**Nevermind, I see what you mean. Read your github, so 24V, and you're asking about yellow manual switch behavior during or after a fault scenario that welded its contacts. I'll add it to my next round of questions for Blue Sea.

>**[@Van Gogh](https://www.fordtransitusaforum.com/members/van-gogh.89410/):**They confirmed its a mechanical breaking of the contacts.

### Normally Open (NO) Contactor

The NO contactor under consideration that meets all requirements is the [TYCO EV200AAANA](http://www.rec-bms.com/datasheet/Technical_datasheet_Kilovac.pdf)

Power usage is 0.07A * 24V = 1.68W

Rated Voltage < 36V

10,000 Cycles at 24V and 2000A

100,000 Cycles at 24V and 200A

Continuous Rating 400MCM 500A

Cost $178

Requires separate manual battery disconnect

# Main Contactor Testing

Findings:

* The Blue Sea ML-RBS 7717 requires a battery connection on one of the main terminals to operate correctly.
* When off the Blue Sea ML-RBS 7717 consumes about 4mA of current.  This is a deal breaker for battery protection.



RBS Power consumption when off: 4mA

REC Wifi Standby 1.8mA
REC Wifi STA 30.9
Rec Wifi goes to standby after one hour

Notes to outside council:
In my system design I am using a Bluesea 7717 24V Latching Remote Battery Switch as my main contactor/battery switch (controlled by the BMS and/or a remote switch). However, during bench top testing I found that when "off" it consumes about 4ma. I confirmed with Blue Sea that this is normal. My concern is the parasitic draw following a Low Voltage disconnect.

I'm considering switching to a NO contactor (the one the BMS OEM recommends): TYCO EV200AAANA. However, without significant repackaging, I can't fit that contactor AND a manual battery switch (e.g. blue sea). My question is whether it is uncommon or a major issue to rely on the contactor as the main disconnect and not use a separate battery switch.

I know there are theoretical concerns with contacts sticking, but I am planning to use REC's precharge unit and with other design limits, high current disconnects or connects should never happen.

I'm mainly trying to figure out which approach carries more risk: A parasitic main contactor/battery switch, or a non-parasitic contactor but no manual battery switch.

I Found a battery switch that will work: Egis XD 500.  Trying to confirm its not vaporware.