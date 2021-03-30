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

It is neccesary to size the DC converters for each concept to determine the no-load power consumption and apply the spec efficiency to converter power loads to analyze base and nominal load cases.

**TLDR:** The 48V concept requires 12V conversion in excess of 944W, resulting in two [600W](https://www.ato.com/Content/doc/dc-dc-converter-24v-to-12v/ATOWG-24S1250.pdf) converters.  The 24V concept requires 12V conversion in excess of 311W, resulting in one [360W](https://www.ato.com/Content/doc/dc-dc-converter-24v-to-12v/ATOWG-24S1230.pdf) converter ([480W](https://www.ato.com/Content/doc/dc-dc-converter-24v-to-12v/ATOWG-24S1240.pdf) is also an option in the same form factor/efficiency/no-load draw).  The uncertainty on load is greater for the 48V concept based on the number of loads that require conversion.

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

~~Heater at max load. [B4L](https://www.heatso.com/espar-b4l-gasoline-heater-kit-12v-4kw/) = 42W (12V)~~

Heater while starting. [B4L](https://www.heatso.com/espar-b4l-gasoline-heater-kit-12v-4kw/) =< 100W (12V)

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

## Reliability

### 24V Reliability

If the 24V to 12V converter fails the system would maintain the capability to power fridge, freezer, water pump, internal fans, lights, laptops/phones, and all AC loads.  You would lose propane.

### 48V Reliability

If the 48V to 12V converter fails the system would maintain AC loads only.

## Rapid Charge Capability

**TLDR:** The 24V concept is adequate from a rapid charge capability for our use case (occasional off grid AC).  The 48V concept greatly exceeds the rapid charge capability of the 24V concept and can likely do so without any use of the factory alternator.

Both these concepts leverage the ability to perform rapid battery charge via the alternator(s).  Both concepts will make use of alternator speed and/or temperature sense to determine charge rate.  Both concepts will make use of the [Transit Stationary Elevated Idle Control (SEIC)](SVE Bulletin Q-239 Stationary Elevated Idle Control.pdf) to achieve high charge rates during idle.  Alternator-Engine RPM ratio is 2.7 per the BEMM.  This results in a base idle alternator speed of 1755 RPM and a SEIC range of 2160 RPM to 6480 RPM.  [This forum post](https://www.fordtransitusaforum.com/threads/rpms.83245/) suggests crusing at 65mph with the new 10 speed transmissions would yield an alternator speed of 5130 RPM.

Note: The BMS limit charge via CAN substanitally (~1A) when the highest cell reaches the balance start voltage setting (2.35V) corresponding to a maximum pack voltage of 27.6V.

### 24V Concept Rapid Charge

**TLDR:** By using maximum idle and both alternators maximally, a charge rate of 5124W (Multiplus Compact 183A at 28V) or 5544W (Multiplus 24/3000 198A at 28V) should be achievable.  This equates to about 10 or 11 hours of air conditioning per hour of idle or driving.  By only using the second alternator, a charge rate of 3724W should be achievable, equating to about 7 hours of air conditioning per hour of idle or driving.

#### Second Alternator Charging

The 24V concept will make use of a Nations "24-150" alternator that is [capable](24V_150_Specs.jpg) of 90A at 28V while idling at 2250 RPM (alternator speed).  Note, the specification for this alternator was provided by a forum member.  I have not recieved confirmation from Nations on performance.  Based on this assumed performance we can achieve the following charge rates:

60A or 1680W at base idle

84A or 2352W at 2160 RPM (low SEIC)

133A or 3724W at 6480 RPM (high SEIC)

#### Factory Alternator Charging

The 24V concept may make use of charging via the Multiplus Compact via Inverter via stock HD Alternator.  The Multiplus Compact is limited to 50A charge or 1380W assuming 27.6V.  With 94% Multiplus efficiency, this corresponds to input power of 1468W supplied by the forward inverter.  With 90% forward inverter efficiency, this corresponds to input power of 1631W supplied by the stock alternator.

Alternatively, the 24V concept may make use of charging via the Multiplus 24/3000 via Inverter via stock HD Alternator.  The Multiplus Compact is limited to 70A charge or 1932W assuming 27.6V.  With 94% Multiplus efficiency, this corresponds to input power of 2055W supplied by the forward inverter.  With 90% forward inverter efficiency, this corresponds to input power of 2284W supplied by the stock alternator.

The capability of the stock HD alternator is unclear and the subject of much debate on the forum.  Another key question is what is the base load required by the vehicle.   Note CCP2 is fused at 175A and is specified to be kept below 175A.  This is a bounding concern if the full 70A charging of the Multiplus 24/3000 is used in hot factory alternator ouput conditions (below 13.1V).  Assuming Hot (60C/13.5V-115C/12.9V) conditions, the BEMM states the stock alternator is capable of:

~70A or 903W/945W at base idle

~130A/150A or 1677W/2025W at 2160 RPM (low SEIC)

~195A/235A or 2515W/3172W at 6480 RPM (high SEIC)

The best data for baseline Transit draw I have found is [here](https://www.fordtransitusaforum.com/threads/ammeter-for-alternator-output.65585/#post-891193).

These numbers suggest that in all cases, at high SEIC, the max charge rate of 68A at the battery should be achievable from the stock alternator (12.9V * [195A-25A] * 0.9 * 0.96 / 27.6 V).  Note, the 25A decrement is based on observed baseline engine-only draw.   This is also possible with a 2000W rated forward inverter.  The RPM breakpoint to lower the charge rate is unclear.  The Multiplus or remote panel is capable of using an aux contact to change the input current limit.  Driving this contact with a microcontroller that is sensing either engine RPM and/or alternator temperature should not be difficult.

### 48V Concept Rapid Charge

**TLDR:** By using maximum idle and both alternators maximally, a charge rate of 5320W to 7560W could be achievable.  This equates to about 10-16 hours of air conditioning per hour of idle or driving.

The 48V concept will make use of a Nations "48-100" alternator that is alledgedly [capable](https://www.fordtransitusaforum.com/threads/2020-awd-148-t-250-hr-van-compass-2-lift-fox-pro-resis-skid-plate-shock-mount-edit-custom-spare-carrier-265-75-16-terrain-contact-at-32-2.81387/post-1076831) of 60A at 56V while idling at 2250 RPM (altenator speed).  Note, the specifications for this alternator were quoted by a forum member based on conversations with Adam Nations.  I have not recieved confirmation from Nations on performance.  Based on this assumed performance we can achieve the following charge rates:

60A or 3360W at base idle

100A or 5600W at some unknown RPM

#### Factory Alternator Charging

The 24V concept may make use of charging via the Quattro via Inverter via stock HD Alternator.  The Quattro is limited to 35A charge or 1960W assuming 56V.  With 94% efficiency, this corresponds to input power of 2085W supplied by the forward inverter.  With 90% forward inverter efficiency, this corresponds to input power of 2317W supplied by the stock alternator.

The capability of the stock HD alternator is unclear and the subject of much debate on the forum.  Another key question is what is the base load required by the vehicle.   Note CCP2 is fused at 175A and is specified to be kept below 175A which could be a bounding concern under hot alternator conditions.  

Based on the factory alternator performance discussed above in the 24V concept, at high SEIC in all cases, the max charge rate of 34A at the battery should be achievable from the stock alternator.  

## Cost

**TLDR:** With the known or estimatible costs available, the 48V system would cost about $582 more than the 24V system.

### Alternator Cost

Without knowing the cost of the 48V alternator option from Nations, it is difficult to judge, but it is safe to assume the 48V alternator option will cost more than the 24V option.

### Inverter Cost

The [Quattro 48/3000/35-50/50 120V](https://www.victronenergy.com/upload/documents/Datasheet-Quattro-3-10kVA-120V-EN.pdf) for the 48V system is $1855 vs the Multiplus Compact for the 24V system which is $1155.

### MPPT Cost

The [Smart Solar 100/20-48](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-75-10,-75-15,-100-15,-100-20_48V-EN.pdf) for the 48V system is $166 vs the [Smart Solar 150/45](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-45-up-to-150-100-EN.pdf) for the 24V system is $450.

### Wiring Cost

Estimating the factor of four reduction in wiring diameter for the 48V system vs the 24V system would reduce the 48V system cost by approximately $200 compared to the 24V system.

### 12V Conversion Cost

The 48V system requires two [600W converters](https://www.ato.com/Content/doc/dc-dc-converter-48v-to-12v/ATOWG-48S1250.pdf) at [$640](https://www.ato.com/dc-dc-buck-converter-48v-to-12v) total.  The 24V system requires one [360W converter](https://www.ato.com/Content/doc/dc-dc-converter-24v-to-12v/ATOWG-24S1230.pdf) at [$174](https://www.ato.com/dc-dc-buck-converter-24v-to-12v).

### Other Cost

To take advantage of the factory alternator using the Orton method, the 24V system will require a transfer switch due to limitations of the Multiplus Compact.  This would increase the 24V system by approximately $100.

## Volume and Weight

**TLDR:** Volume and weight are not a major factor.  

The 48V system would weight about 20 lbs more due to the weight of the DC power conversion and the larger inverter charger offset by a smaller MPPT.  Volume-wise, the 48V system might be more difficult to arrange due to the additional DC power conversion, but wiring would be easier with the smaller required gauge.

## Wiring

**TLDR:** 48V uses much smaller (1/4th) size wire than 24V for comprable performance.  This pays of in cost, difficulty in routing, difficulty in terminating, and criticality of terminations.

**24v to 48v Equivalent Voltage Drop % and Equal Loss for the Same Transmitted Power**

V=IR.  Because I has decreased by 1/2 and Vsource has increased by 2, to achive the same fraction of Vsource/Vdrop, Vdrop must also double.  This implies R must increase by a factor of 4.

P = R*I<sup>2</sup>.  I has decreased by a factor of 1/2, thus I<sup>2</sup> has decreased by a factor of 1/4.  This implies R must increase by a factor of 4.

**Roughly:**

4/0 becomes 2 AWG

2 AWG becomes 6 AWG

8 AWG becomes 14 AWG

**Cost Deltas:**

50 ft 4/0 Ancor = $290

50 ft 2/0 Ancor = $215

50 ft 2 AWG Ancor = $119

50 ft 4 AWG Ancor = $85

50 ft 8 AWG Ancor = $52

