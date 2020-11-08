---
section: "van"
category: "envelope"
title: "Insulation"
author: "Stello"
data: " 2020-11-5"
tags: ["insulation", "design", "concept"]
---



## Helpful Links

[Sprinter Source Thread](https://sprinter-source.com/forums/index.php?threads/74260/)
[Transit Forum Thread](https://www.fordtransitusaforum.com/threads/insulation-effectiveness.76890/)

[Video Regarding XPS vs PolyISO](https://www.youtube.com/watch?v=evMsenbwttw) - XPS prefered with potential moisture and more physically robust according to company spokesperson.



## Ceiling

**TLDR:  XPS doesn't offer a substantial advantage over Thisulate.  Insulating the backside of the panels doesn't offer a substantial advantage over not insulating the backside of the panels.**

[Link to google spreadsheet](https://docs.google.com/spreadsheets/d/17qdIqUtVVReb5lz_uMptEpswP-8dfLng_9TE0L671E0/edit?usp=sharing) used to calculate resistance values.  One area of uncertainty is the thermal break between the roof skin and ribs.  In this [forum discussion](https://www.fordtransitusaforum.com/threads/spray-foam-insulation-roof-leaks.74412/post-986882), Hein refers to the roof rib thermal break as urethane foam.  Specific details for associated assumptions are in the google spreadsheet.

### Thermal Model and corresponding LT Spice Model

![Ceiling Thermal Model](ceiling_thermal_model.svg)

![LT Spice Model](ceiling_thermal_model_thinsulate.jpg)

### Thinsulate vs XPS Sensitivity

The following analyses use a delta T of 30C applied as a DC voltage potential to the resistor network.  Current represents heat flow in watts.  Total loss for Thinsulate and XPS are 182W and 155W respectively.  Other than bulk transfer, the next major loss path is the ribs corresponding to between 25-30% of the total loss.

| Resistor | Thinsulate Watts | XPS Watts |
| -------- | ------------------ | ----------- |
| I(R25)   | 182.335            | 155.128     |
| I(R24)   | 15.3492            | 15.7066     |
| I(R23)   | 46.43              | 47.511      |
| I(R22)   | 46.43              | 47.511      |
| I(R21)   | 46.43              | 47.511      |
| I(R19)   | 10.1815            | 10.4186     |
| I(R18)   | 0.731193           | 0.748217    |
| I(R17)   | 1.53897            | 1.5748      |
| I(R16)   | 47.969             | 49.0858     |
| I(R15)   | 9.37374            | 9.59198     |
| I(R14)   | 9.37374            | 9.59198     |
| I(R13)   | 47.969             | 49.0858     |
| I(R12)   | 57.3427            | 58.6778     |
| I(R11)   | 4.43649            | 4.53979     |
| I(R10)   | 4.43649            | 4.53979     |
| I(R9)    | 4.43649            | 4.53979     |
| I(R8)    | 4.43649            | 4.53979     |
| I(R7)    | 120.555            | 91.9108     |
| I(R6)    | 120.555            | 91.9108     |
| I(R5)    | 120.555            | 91.9108     |
| I(R4)    | 120.555            | 91.9108     |
| I(R3)    | 124.992            | 96.4505     |
| I(R2)    | 57.3427            | 58.6778     |
| I(R1)    | 182.335            | 155.128     |



### Panel Backside Insulation Sensitivity

The following analyses use a delta T of 30C applied as a DC voltage potential to the resistor network.  Current represents heat flow in watts.  Backside insulation consists of 1/8" of Neoprene adhered to the backside of panels.  Total loss for backside insulation and no-backside insulation are 182W and 205W respectively.  Most of the additional heat loss is seen in the rib regions.

| Resistor | Panel Backside Insulation Watts | NO Panel Backside Insulation Watts |
| -------- | ------------------------------- | ---------------------------------- |
| I(R25)   | 182.335                         | 205.443                            |
| I(R24)   | 15.3492                         | 14.5922                            |
| I(R23)   | 46.43                           | 62.977                             |
| I(R22)   | 46.43                           | 62.977                             |
| I(R21)   | 46.43                           | 62.977                             |
| I(R19)   | 10.1815                         | 9.22395                            |
| I(R18)   | 0.731193                        | 0.662424                           |
| I(R17)   | 1.53897                         | 1.33158                            |
| I(R16)   | 47.969                          | 64.3086                            |
| I(R15)   | 9.37374                         | 8.55479                            |
| I(R14)   | 9.37374                         | 8.55479                            |
| I(R13)   | 47.969                          | 64.3086                            |
| I(R12)   | 57.3427                         | 72.8633                            |
| I(R11)   | 4.43649                         | 4.70583                            |
| I(R10)   | 4.43649                         | 4.70583                            |
| I(R9)    | 4.43649                         | 4.70583                            |
| I(R8)    | 4.43649                         | 4.70583                            |
| I(R7)    | 120.555                         | 127.873                            |
| I(R6)    | 120.555                         | 127.873                            |
| I(R5)    | 120.555                         | 127.873                            |
| I(R4)    | 120.555                         | 127.873                            |
| I(R3)    | 124.992                         | 132.579                            |
| I(R2)    | 57.3427                         | 72.8633                            |
| I(R1)    | 182.335                         | 205.443                            |
