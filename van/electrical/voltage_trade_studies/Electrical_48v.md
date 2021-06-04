---
section: "van"
category: "electrical"
title: "48V Electrical Concept"
author: "Stello"
date: "2020-10-26"
tags: ["48V", 24V", "12V", "design", "concept", "electrical", "van"]
---
# 48V Electrical Concept

### Assumptions

* 48V 200AH LFP
* 24V Fridge and Freezer
* [Quattro 48/3000/35-50/50 120V](https://www.victronenergy.com/upload/documents/Datasheet-Quattro-3-10kVA-120V-EN.pdf) ($1855)
* 48V Alternator
* 1 48V to 24V converter (1500W) [Candidate](https://www.ato.com/Content/doc/dc-dc-converter-48v-to-24v/ATOWG-48S2463.pdf) ($99) (or skip 24V all together)
* 1 48V to 12V converter (? W) [Candidate](https://www.ato.com/Content/doc/dc-dc-converter-48v-to-12v/ATOWG-48S1230.pdf) ($37)
* [Smart Solar 100/20-48](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-75-10,-75-15,-100-15,-100-20_48V-EN.pdf) ($166)
* Need HV Solar panels so would use Panasonics (Victron MPPT "chooser" says they should work)

### Open Questions

* Does REC BMS that supports 48V also support Victron? [Yes](http://www.rec-bms.com/datasheet/UserManual_REC_Victron_BMS.pdf)

* Does Wakespeed 500 support 48V? Yes according to Nation's? Yes according to Nations and Wakespeed manual.

### Benefits

* MPPT is 0.65 kg and 678000 mm<sup>3</sup> and $166 for 48V vs 3 kg and 4393750 mm^3  and ~$450 for 24V vs 4.5 kg and 6563160 mm^3 and $700 for 12V
* Alternator line temperature rise will be 1/16 of 12V for equivalent wire.
* Second Quattro AC input can be used for Orton Method charging with an independent current limit.
* Much smaller wire and forgiveness on lugged connections

### Downsides

* Known latching relays are limited 12V and 24V (Gigavac)
* Known high efficiency (~1W) non-latching relays are limited to 12V and 24V (Gigavac) vs ~8W
* BlueSea Remote Battery Switch is limited to 12V or 24V
* Not all MEGA fuses are rated beyond 24V

* Inverter is same size, 5W higher no load, and same weight for 24V and 12V (but more expensive)
* Extra parasitic draw for 12V (and 24V if optioned) conversion
* Extra loss for 24V conversion
* This [post from forum user **Van Gohg** sums it all up](https://www.fordtransitusaforum.com/threads/12v-24v-or-48v-house-battery.82319/post-1069724)

Similar/Equavalent Wire Comparisons:

**12v to 48v Equivalent Voltage Drop % and Equal Loss for the Same Transmitted Power**

V=IR.  Because I has decreased by 1/4 and Vsource has increased by 4, to achive the same fraction of Vsource/Vdrop, Vdrop must also double.  This implies R must increase by a factor of 16.

P = R*I<sup>2</sup>.  I has decreased by a factor of 1/2, thus I<sup>2</sup> has decreased by a factor of 1/16.  This implies R must increase by a factor of 16.

4/0 becomes 8 AWG [TODO: Check the math on all these]

2 AWG becomes 14 AWG

**12v to 48v Equivalent Ampacity for Same Power**

4/0 becomes 6 AWG



50 ft 4/0 Ancor = $290

50 ft 2/0 Ancor = $215

50 ft 2 AWG Ancor = $119

50 ft 4 AWG Ancor = $85

50 ft 8 AWG Ancor = $52

**48V Contactor Options**:

GigaVac Minitactor - NO, I=80A, P<sub>coil_at_54v</sub>=2.7W 

GigaVac HX22 - NO, I=300A, P<sub>coil_48V_listed</sub>=7.8W

GigaVAc HX200 - NO, I=350, P<sub>coil_48V_listed</sub>=2.1W

GigaVAc HX21 - NO, I=350A, P<sub>coil_48V_listed</sub>=2.1W

GigaVAc HX241 - NO, I=400A, P<sub>coil_48V_listed</sub>=2.0W

Most GigaVac MX series are generally 7.6W at 48V

GigaVAc MX23 - NO, I=300A, P<sub>coil_48V_listed</sub>=2.0W, P<sub>contact@300A</sub>=45W

**GigaVAc MX14,MX64,MX15 - NO, I=400A, P<sub>coil_48V_listed</sub>=2.0W, P<sub>contact@400A</sub>=60W, R<sub>contact_max</sub>=0.375ohm**

Most GigaVac GX series are 7.6W at 48V

GigaVac GV200 - NO, I=500A, P<sub>coil_48V_listed</sub>=2.0W, P<sub>contact@500A</sub>=38-100W

GigaVac GX14,GX23,GX24,GX34,GX54 - NO, i=350A, P<sub>coil_48V_listed</sub>=2.0W, P<sub>contact@350A</sub>=18-49W

Most GigaVac GV series are 7.6W or 6W at 48V

GigaVac GV240,GV140 - NO, I=400A, P<sub>coil_48V_listed</sub>=2.0W, P<sub>contact@400A</sub>=48-54W

TYCO makes an attractive option - [KILOVAC EV200](http://www.rec-bms.com/datasheet/Technical_datasheet_Kilovac.pdf):

P<sub>coil_48V_listed</sub>=1.44W, P<sub>contact_typ@400A</sub>=32W

