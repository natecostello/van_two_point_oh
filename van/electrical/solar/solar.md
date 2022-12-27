---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Solar
author: Nate
date: 2021-02-06
tags:
 - solar
 - design
 - concept
 - electrical
 - van

metatags:
 #
cover: 
	# image file
	# img: img
	# if attribution is needed
	# source: [vecteezy]
	# url: url
tldr:
---


**TLDR:**  The system is composed of four [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel) 200W panels in a 2S2P arrangement and a [SmartSolar 150/45](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-45-up-to-150-70-EN.pdf) MPPT.  A portable ground array, if pursued, will use a separate MPPT to maximize flexibility in panel choice (specifically dimensional flexibility).

## Requirements

### Electrical

With the 24V nominal DC system, the solar panels need to provide a voltage in excess of 24V to ensure enough headroom for the MPPT to charge the battery.  Higher panel voltage will also allow reduced wire diameter.  

### Dimensional

With the Hein/Angle based roof mounting concept, panels need to be no longer than about 59".  The closer the panels are to filling this dimenions, the smaller the area of roof length the panels will occupy.

## Candidates

Based on the dimensional requirements, the two panels that will fit are the [Grape Solar](https://grapesolar.com/wp-content/uploads/GS-STAR-190W-US-Spec-Sheet.pdf)  (58.3 x 26.6 x 1.6 in) 190W 12V panel and the [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel)  (58.7 x 26.8 x 1.4 in) 200W 24V panel.

## Selection

The [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel)  (58.7 x 26.8 x 1.4 in) 200W 24V panel provides the max power density and optimal voltage.

**Specifications:**

- Maximum Power(Pmax): 200W
- Maximum Power Voltage(Vmp): 37.6V
- Maximum Power Current(Imp): 5.36A
- Open Circuit Voltage(Voc): 45.4V
- Short Circuit Current(Isc): 5.83A
- Weight: 26.5 lbs
- Dimensions: 58.7 x 26.8 x 1.4 in

## Wiring Configurations

For the main roof array, either 4S1P, 2S2P, or 1S4P could be supported and ensure enough headroom over the system voltage to ensure MPPT operation.

Assuming 10AWG wire from the panels, with a single run length of 15ft, assuming Vmp and Imp, the PV efficiency is as follows:

1S4P: I<sub>array</sub> = 21.44A, V<sub>array</sub> = 37.6V, V<sub>drop</sub> = 0.64V, P<sub>loss</sub> = 0.64*21.44 = 13.72W

2S2P: I<sub>array</sub> = 10.72A, V<sub>array</sub> = 75.2V, V<sub>drop</sub> = 0.32V, P<sub>loss</sub> = 0.32*10.72 = 3.43W

4S1P: I<sub>array</sub> = 5.83A, V<sub>array</sub> = 150.40, V<sub>drop</sub> = 0.17V, P<sub>loss</sub> = 0.17*5.83 = 0.99W

The 1S4P arrangement has the worst efficiency and is current limited by the Victron MPPT models that could take advantage of the low array voltage (specifically the 75/X models are limited to an output current of 15A)

The 4S1P arrangement will required the SmartSolar 250/XX line which sells at a premium to equivalent lower voltage models with the same output current capability (e.g. 250/60 at $638 vs 150/60 at $540) and isn't available in models that match our maximum output current (~33A).

The 2S2P arrangement provides the best tradeoff on system efficiency (~99%) and provides more flexibility for MPPT selection (specifically the 100/X and 150/X lines). 

## MPPT Requirements

* Minimize Cost

* Fully Utilize Solar Array Power

* Minimize Parasitic Draw

* Minimize Cost

* Minimize Size

## MPPT Selection

**TLDR:** The SmartSolar 100/50 or 150/35 are both capable of supporting the planned array.  Both are the same cost, same weight, and same size.  The 100/50 will not run as hard against current limits.  The selection should come down to which design is more modern and has a better track record.

The evaluation below assumes a 2S2P arrangment.  To maximize flexibility (and panel geometry) of any future ground array, we will plan to install a separate MPPT.  As such, the following only assumes the MPPT is optimized to support the existing array.

Assuming a 2S2P arrangement, a SmartSolar 100/30 is recommended by Victron (via thier online tool).  However, based on the EVE 280 cell datasheet, the battery voltage, when fully charged, at a low (0.1C) discharge rate is only 26.4V at which point the 100/30 is current limited at 30A.  

#### SmartSolar 100/30 

[($226, 20mA parasitic, 98% efficiency, 5.12x7.32x2.76, 2.87lbs)](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-100-30-&-100-50-EN.pdf) 

This model is recommended by the Victron online tool.  However, based on the EVE 280 cell datasheet, the battery voltage is 26.4V, when fully charged at a low (0.1C) discharge rate, at which point this MPPT is current limited at 30A and would be for all lower SOC conditions in full sun.  This results in the MPPT running at 100% power during all full sun conditions.

This model does NOT support remote on/off in addition to VE.Direct communication with the Cerbo and thus will not allow for hardware backup over charge protection.

#### SmartSolar 100/50 

[($324, 20mA parasitic, 98% efficency, 5.12x7.32x2.76 in, 2.87lbs )](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-100-30-&-100-50-EN.pdf) 

This model can sustain full array power output all the way down to a SOC below the knee of the curve (<~5% SOC) shown on the EVE 280 cell datasheet.

By installing two, it could support the same array configurations as a ground array, and support up to 3 [Panasonic 330W](https://panasonic.net/lifesolutions/solar/pdf/96/spec/N330_325SJ47Datasheet_190401_ol_LS.PDF) panels in either a 1S2P or 1S3P.

This model does NOT support remote on/off in addition to VE.Direct communication with the Cerbo and thus will not allow for hardware backup over charge protection.

#### SmartSolar 150/35 

[($323, 15mA parasitic, 98% efficiency, 5.12x7.32x2.76 in, 2.76lbs)](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-35-EN.pdf) 

This model can sustain full array power output all the way down to a SOC below the knee of the curve (<~5% SOC) shown on the EVE 280 cell datasheet.

This model could also support a 3S1P configuration (future flexibility).  By installing two, it could support the same array configurations as a ground array, and support 2 [Panasonic 330W](https://panasonic.net/lifesolutions/solar/pdf/96/spec/N330_325SJ47Datasheet_190401_ol_LS.PDF) panels in either a 2S1P, 1S2P.

This model does NOT support remote on/off in addition to VE.Direct communication with the Cerbo and thus will not allow for hardware backup over charge protection.

#### SmartSolar 150/45 

[($492, ~30mA parasitic, 98% efficiency, 7.28x9.84x3.74 in, 6.61lbs)](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-45-up-to-150-100-EN.pdf)

This model is substantially more expensive, larger, and heavier.  It has greater power capacity, but that is in excess of the array's capability and is not warranted.  It could support an 1S2P ground array of the Rich Solar panels in parallel with the roof array if desired.

However, this is the lowest power model of the 150/XX line that offers separate VE.Direct communication and remote on/off.  This allows the BMS to provide a low temperature hardware backup shutoff in the event of CANBUS failure or Cerbo failure.  It is not needed for cell overvoltage, cell undervoltage, and cell overtemperature as this is provided by the BMS opening the main contactor.  **For this reason only, low temperature backup protection, this will be the selected MPPT.**

## Wiring and Implementation Details
To join the panels in a 2S2P arrangement we will use an MC-4 Branch connector.  This [product](https://www.amazon.com/BougeRV-Connectors-Connector-Parallel-Connection/dp/B07DJ5PHSB/) is cheap and had good reviews.


To ensure a good cable gland seal, we want a round cable.  AM Solar sells a 10AWG duplex [cable](https://amsolar.com/rv-cables/cable-10ga-2-gry) for precisely this purpose.  We used this approach on Van 1.0.

To route the solar conductors through the roof we will use a single right angle cable gland.  We need to make sure this gland is sized to form a good seal on the round AM Solar cable.  Unfortunately, AM solar doesn't list an OD for the cable.  However, they do list [this](https://amsolar.com/rv-mounting-accessories/strn-1/2ln) straight gland for use with it, which has a recommended cable range of 0.230"-0.546" (5.8mm-13.9mm).  10AWG OD is generally over 5mm so for duplex, we will aim for a gland that covers the high end of the AM Solar gland range.
This [product](https://www.amazon.com/uxcell-Waterproof-Adjustable-Locknut-9mm-14mm/dp/B07R55VGVV/) is 9mm-14mm so it should work.

To join the round cable to the MC-4 connectors, AM solar sells [kits/pigtails](https://amsolar.com/rv-connections/93c-mc-4pig) to splice this connection (easier and cheaper than a MC-4 termination tool).  We used this approach on Van 1.0.

Inside the van, the round 10AWG duplex will be butt spliced to the solar wiring.  

The interior wiring will terminate into [this](https://www.amazon.com/gp/product/B0746DLP7S/) 2 pole solar breaker.

From the solar breaker it will proceed to the MPPT.


