---
section: "van"
category: "electrical"
title: "Solar Panels"
author: "Stello"
date: "2021-2-6"
tags: ["solar", "panels", "design", "concept"]
---

## Requirements

### Electrical

With the 24V nominal DC system, the solar panels need to provide a voltage in excess of 24V to ensure enough headroom for the MPPT to charge the battery.  Higher panel voltage will also allow reduced wire diameter.  

### Dimensional

With the Hein/Angle based roof mounting concept, panels need to be no longer than about 59".  The closer the panels are to filling this dimenions, the smaller the area of roof length the panels will occupy.

## Candidates

Based on the dimensional requirements, the two panels that will fit are the [Grape Solar](https://grapesolar.com/wp-content/uploads/GS-STAR-190W-US-Spec-Sheet.pdf)  (58.3 x 26.6 x 1.6 in) 190W 12V panel and the [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel)  (58.7 x 26.8 x 1.4 in) 200W 24V panel.

## Selection

The [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel)  (58.7 x 26.8 x 1.4 in) 200W 24V panel provides the max power density and optimal voltage.

### Specifications

- Maximum Power(Pmax): 200W
- Maximum Power Voltage(Vmp): 37.6V
- Maximum Power Current(Imp): 5.36A
- Open Circuit Voltage(Voc): 45.4V
- Short Circuit Current(Isc): 5.83A
- Weight: 26.5 lbs
- Dimensions: 58.7 x 26.8 x 1.4 in



Assuming a 2S2P arrangement, a SmartSolar 100/30 is recommended by Victron.  It would max current at low SOC and high solar power.

Assuming a 2S4P arrangement (a ground array for exanded capability), a SmartSolar  150/60 is recommented by Victron.  It would max current at low SOC and high solar power.  For an incremental cost increase, a 150/70 would be less likely to limit current.  TODO: Ask on the forum.


