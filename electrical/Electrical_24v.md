---
section: "van"
category: "electrical"
title: "24V Electrical Concept"
author: "Stello"
date: "2020-10-26"
tags: ["24V", "12V", "design", "concept", "electrical", "van"]
---
# 24V Electrical Concept

### Assumptions

* 24V 400AH LFP
* 24V Fridge and Freezer
* [Multiplus 24/3000/70](https://www.victronenergy.com/upload/documents/Datasheet-Multiplus-inverter-charger_2kVA-and-3kVA-120V-US-EN.pdf) ($1,284)
* 24V Alternator
* 2+ [24/12-25 Orion DC-DC Converters](https://www.victronenergy.com/upload/documents/Datasheet-Orion-DC-DC-converters-high-power,-non-isolated-EN.pdf) (2*75$) or 1 480W 24V to 12V for ($38)
* [Smart Solar 150/45](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-45-up-to-150-100-EN.pdf) ($450)

### Open Questions

* Does REC BMS that supports 24V also support Victron? [Yes](http://www.rec-bms.com/datasheet/UserManual_REC_Victron_BMS.pdf)
* Does Wakespeed 500 support 24V? Yes according to Nation's? Yes according to Nations and Wakespeed manual.
* Availability of 24V alternator for 2021 Transit?  According to 10-27-220 discussion with Nations, the only 24V alternator available that is compatible with the 2020 Transit is the 55XP-WS500 serious which is $3299.95.  Not verified: Compatibility with 2021 3.5 Ecoboost, Price of 2nd alternator bracket, and whether price includes wakespeed 500.

### Benefits

* MPPT is 3 kg and 4393750 mm^3  and ~$450 for 24V vs 4.5 kg and 6563160 mm^3 and $700 for 12V
* Alternator line temperature rise will be 1/4 of 12V for equivalent wire.



Similar/Equavalent Wire Comparisons:

**12v to 24v Equivalent Voltage Drop % and Equal Loss for the Same Transmitted Power**

V=IR.  Because I has decreased by 1/2 and Vsource has increased by 2, to achive the same fraction of Vsource/Vdrop, Vdrop must also double.  This implies R must increase by a factor of 4.

P = R*I<sup>2</sup>.  I has decreased by a factor of 1/2, thus I<sup>2</sup> has decreased by a factor of 1/4.  This implies R must increase by a factor of 4.

4/0 becomes 2 AWG

2 AWG becomes 8 AWG

8 AWG becomes 14 AWG

**12v to 24v Equivalent Ampacity for Same Power**

4/0 becomes 2 AWG

2 AWG becomes 6 AWG

8 AWG becomes 14 AWG