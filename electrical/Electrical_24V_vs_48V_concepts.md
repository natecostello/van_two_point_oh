---
section: "van"
category: "electrical"
title: "48V vs 24V Electrical Concept"
author: "Stello"
date: "2020-12-29"
tags: ["48V", 24V", "12V", "design", "concept", "electrical", "van"]
---
# 48V vs 24V Electrical Concept

## Load Study

The calculations behind the load study are in [this spreadsheet](https://docs.google.com/spreadsheets/d/1X7njD1I48CtzVDgUu9Sp_Ce2chWM4oQiqM1aEl7uJWI/edit?usp=sharing).  For the 48V concept, all DC loads will be powered at 12V via conversion.  For the 24V concept, all loads that can be powered directly from 24V will be.  For the nominal and base load cases, the 24V concept is about 20% more efficient.  Under nominal loads, it would mean more days requiring driving or idling to offset usage (i.e., installed solar is not sufficient) or reliance on auxilliary panels on late fall, winter, ealy spring, or otherwise shaded days.

### Base Load

**TLDR:** Base load for the 48V concept is 21% (514 watt-hours) higher than the 24V concept.

#### Assumptions
These are assumed loads that will run at all times while the electrical system is operational.  Essentially, these are the loads that need to be able to run indefinitely via solar power, including times while we are away from the van.

Battery Relay is non-latching and engaged at all times.

[Max air fan](https://faroutride.com/maxxfan-review/) at 2 = (0.2*13.5V = 3W)

Speakers Idle ([2.1W](https://support.sonos.com/s/article/256?language=en_US) x 2)

Fridge and Freezer will run at all times (assuming avg = nominal consumption/2).

​	Freezer: [C55BT](https://www.vitrifrigo.com/ww/en/c55bt_freezer_external_cooling_unit) = (38W/2 = 19W)

​	Fridge: [C130L](https://www.vitrifrigo.com/ww/en/c130l-external-cooling-unit) = (45W/2 = 23W)

Router, Switch, etc powered at all times. 

​	AP One Rugged = [5.5W](https://forum.peplink.com/t/peplink-ap-one-ac-mini-and-ap-one-enterprise-typical-watts/24644)

​	MAX BR1 MK2 = 8W (spec minimum)

​	[Prosafe GS108V4](https://www.netguardstore.com/datasheets/Switch/GS105_GS108_GS108PP_DS.pdf) = [2.6W](https://www.servethehome.com/netgear-gs108-8port-unmanaged-gigabit-switch-review-gs108na/#:~:text=Idle%20power%20consumption%20(2x%20RJ,45%20gigabit%20links%3A%206.8w))

NAS powered at all times (Hibernation). [DS218](https://www.synology.com/en-us/products/compare/DS218/DS218play/DS418) = 6W

Raspberry Pi powered at all times (at minimum power).

Heater at minimum. [B4L](https://www.heatso.com/espar-b4l-gasoline-heater-kit-12v-4kw/) = 7W

24V (or 48V)->12V converter will be powered at all times.

120 VAC Inverter will be powered on

MPPT will be powered on at all times.

Cerbo will be powered at all times.

### Nominal Load

**TLDR:** Nominal load for the 48V concept is 17% (553 watt-hours) higher than the 24V concept.

#### Assumptions

These are assumed loads running on a daily basis during normal usage.  This would account for things like laptop usage, phone charging, and lights.

Battery Relay is non-latching and engaged at all times.

[Max air fan](https://faroutride.com/maxxfan-review/) at 5 = (0.6*13.5V = 8.1W) 10 hours per day

[Sirocco II](https://www.amazon.com/Sirocco-24V-Gimbal-Size-Black/dp/B01LDY4X36/ref=sr_1_8?dchild=1&keywords=Marine+12+Volt+Fan&qid=1609256579&sr=8-8) x 2 @ medium (2x0.22Ax13.5V=6W) (2x0.11Ax27V=6W) (12 or 24W) 10 Hours per day

Lights (24W) 5 Hours Per Day (24W is based on Van 1.0 lighting)

Speakers ([Source](https://en.community.sonos.com/components-228996/power-consumption-6763681)) (11W x 2) 5 Hours Per Day,  (2.1W x 2) Idle 19 Hours Per Day

Max Laptop Draw ([Limited by Charger to 46W](https://www.amazon.com/Charger-Waterproof-Delivery-Voltmeter-Motorcycle/dp/B07NV9D61R/ref=sr_1_4?dchild=1&keywords=24v%2BUSB%2Bc%2Bcharger&qid=1609255486&sr=8-4&th=1_) )

​	MBP (46W) 5 Hours Per Day

​	MBA (46W) 5 Hours Per Day

Phone Charging ([Neglect secondary power conversion](https://www.amazon.com/Charger-Waterproof-Delivery-Voltmeter-Motorcycle/dp/B07NV9D61R/ref=sr_1_4?dchild=1&keywords=24v%2BUSB%2Bc%2Bcharger&qid=1609255486&sr=8-4&th=1_))

​	Iphone 11 [(25W)](http://www.chargerlab.com/iphone-11-pro-max-charging-test/) 2 Hours Per Day

​	Iphone 11 [(25W)](http://www.chargerlab.com/iphone-11-pro-max-charging-test/) 2 Hours Per Day

Fridge and Freezer will run at all times (avg = nominal consumption/2).

​	Freezer: [C55BT](https://www.vitrifrigo.com/ww/en/c55bt_freezer_external_cooling_unit) = (38W/2 = 19W)

​	Fridge: [C130L](https://www.vitrifrigo.com/ww/en/c130l-external-cooling-unit) = (45W/2 = 23W)

Router, Switch, etc powered at all times. 

​	AP One Rugged = 13W

​	MAX BR1 MK2 = 11W

​	[Prosafe GS108V4](https://www.netguardstore.com/datasheets/Switch/GS105_GS108_GS108PP_DS.pdf) = 5W

NAS powered at all times (Hibernation). [DS218](https://www.synology.com/en-us/products/compare/DS218/DS218play/DS418) = 6W

Raspberry Pi powered at all times (at minimum power).

Heater at minimum. [B4L](https://www.heatso.com/espar-b4l-gasoline-heater-kit-12v-4kw/) = 7W 10 Hours per day

24V (or 48V)->12V converter will be powered at all times.

120 VAC Inverter will be powered on, but not delivering AC, at all times.

MPPT will be powered on at all times.

Cerbo will be powered at all times.



### Converter Sizing

**TLDR:** The 48V concept requires 12V conversion in excess of 886W, resulting in two 600W converters.  The 24V concept requires 12V conversion in excess of 233W, resulting in one 360W converter.

#### Assumptions

The converter(s) will be sized to be capable of providing max simultaneous demand from all loads.  While this is conservative, we don't want to have to consider what is running when we fire up a load, turn on the water, etc.

Air Compressor will be powered from house system and can be powered under all load conditions.

​	[Hypergrade](https://www.viaircorp.com/recently-added-products/330c-hg) 200 psi (14A*13.5V = 189W) (12 or 24V)

Fans

​	[Max Air fan](https://faroutride.com/maxxfan-review/) @ max power (2.8A*13.5V = 38W) (12V)

​	[Sirocco II](https://www.amazon.com/Sirocco-24V-Gimbal-Size-Black/dp/B01LDY4X36/ref=sr_1_8?dchild=1&keywords=Marine+12+Volt+Fan&qid=1609256579&sr=8-8) x 2 @ max power (2x0.35Ax13.5V=10W) (2x0.21Ax27V=12W) (12 or 24W)

Fridge and Freezer can be at max draw

​	Freezer: [C55BT](https://www.vitrifrigo.com/ww/en/c55bt_freezer_external_cooling_unit) = (38W) (12 or 24V)

​	Fridge: [C130L](https://www.vitrifrigo.com/ww/en/c130l-external-cooling-unit) = (45W) (12 or 24V)

Router, Switch, etc powered at maximum 

​	AP One Rugged = 13W (12V)

​	MAX BR1 MK2 = 16W (12V)

​	[Prosafe GS108V4](https://www.netguardstore.com/datasheets/Switch/GS105_GS108_GS108PP_DS.pdf) = 5W (12V)

NAS full access. [DS218](https://www.synology.com/en-us/products/compare/DS218/DS218play/DS418) = 15W (12V)

Raspberry Pi 4 max power = 6W (12V)

Lights (24W) (Based on Van 1.0)

Radio powered and transmitting

​	[Anytone AT-D578UVIIIPRo](https://www.bridgecomsystems.com/collections/amateur-mobile-radios/products/at-d578uv) = 50W (12V)

Heater at max load. [B4L](https://www.heatso.com/espar-b4l-gasoline-heater-kit-12v-4kw/) = 42W (12V)

Max Laptop Draw ([Limited by Charger to 46W](https://www.amazon.com/Charger-Waterproof-Delivery-Voltmeter-Motorcycle/dp/B07NV9D61R/ref=sr_1_4?dchild=1&keywords=24v%2BUSB%2Bc%2Bcharger&qid=1609255486&sr=8-4&th=1_) )

​	MBP (46W)

​	MBA (46W)

Phone Charging ([Neglect secondary power conversion](https://www.amazon.com/Charger-Waterproof-Delivery-Voltmeter-Motorcycle/dp/B07NV9D61R/ref=sr_1_4?dchild=1&keywords=24v%2BUSB%2Bc%2Bcharger&qid=1609255486&sr=8-4&th=1_))

​	Iphone 11 [(25W)](http://www.chargerlab.com/iphone-11-pro-max-charging-test/)

​	Iphone 11 [(25W)](http://www.chargerlab.com/iphone-11-pro-max-charging-test/)

Note: Camera will charge from 120VAC so not counted.

Drone Charging

​	[Mavic Air 2 12V Charger](https://store.dji.com/product/mavic-air-2-car-charger?set_country=US&gclid=CjwKCAiAxKv_BRBdEiwAyd40N7s4sUNNY8LttvijuelUnwwQHZfPSOqMRu1qVGWplTxsHLgBQC6FOxoC408QAvD_BwE) (36W)

Propane Solenoid On ([20W](https://www.amazon.com/Stainless-Steel-Electric-Solenoid-Valve/dp/B00APDEASA/ref=sr_1_6?dchild=1&keywords=propane+solenoid+valve+24V&qid=1609269304&sr=8-6))

Water Pump On (176W)



​	











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

