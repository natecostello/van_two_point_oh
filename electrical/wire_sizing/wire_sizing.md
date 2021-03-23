---
section: "van"
category: "electrical"
title: "Wire Size"
author: "Stello"
date: "2021-3-20"
tags: ["wiring", "design", "final"]
---

The following evaluation assumes wire with insulation rated to 105C based on [this chart](http://assets.bluesea.com/files/resources/reference/21731.pdf) and voltage drop calculations based on [this calculator](https://www.calculator.net/voltage-drop-calculator.html?material=copper&wiresize=4.132&voltage=24&phase=dc&noofconductor=1&distance=6&distanceunit=feet&amperes=42&x=50&y=23).  [This chart](http://assets.bluesea.com/files/resources/newsletter/images/DC_wire_selection_chartlg.jpg) is also useful for quick reference.

# Main DC Distribution Wiring

## Battery to Lynx

Maximum theoritical/ideal charging current is 272A.  Round trip wire length is approximately 3 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 0 AWG.

* Battery at minimum 22.4V (low cell voltage cutoff of 2.8v)
* Max Aftermarket Alternator Charging = 150A
* Max Multplus Charging = 50A
* 800W Primary Solar Charging (perfect efficiency) = 36A
* 800W Ground Array Solar Charging (perfect efficiency) = 36A

## Aftermarket Alternator to Lynx

Maximum charge current is 150A.  Round trip wire length is approximately 44 ft.  By ampacity, minimum wire size is 4 AWG.  By voltage drop, minimum wire size is 0 AWG.

## Multiplus Compact Inverter/Charger to Lynx

Maximum charge current is 50A.  Maximum discharge current is 190A assuming minimum battery voltage (22.4V), peak power (4000W), and maximum efficiency (94%).  Round trip wire length is approximately 11.5 ft.  Wire size is limited by ampacity, not voltage drop. Minimum wire size is 2 AWG.

## Solar MPPT to Lynx

For future flexibility, a ground array up to 800W is assumed.  This will use a second MPPT that will be paralleled with the primary roof array of 800W at a terminal, and then routed to the Lynx.  Wiring from the point of parallel to the Lynx and the branch to the MPPTs will be sized for the same ampacity to allow use of a single fuse in the Lynx to cover wire including the branches.

Maximum charge current is 72A assuming minimum battery voltage (22.4V) and perfect MPPT efficiency.  Round trip wire length is approximately 11.5 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 8 AWG.  To simplify wire ordering and termination, 2 AWG will be considered.

## Main DC Panel to Lynx

Maximum discharge current is 42A based on the maximum load (944W) in the converter sizing study in [this spreadsheet](https://docs.google.com/spreadsheets/d/1X7njD1I48CtzVDgUu9Sp_Ce2chWM4oQiqM1aEl7uJWI/edit?usp=sharing) assuming minimum battery voltage (22.4V).  Round trip wire length is approximately 12 ft.  By ampacity, minimum wire size is 12 AWG.  By voltage drop, minimum wire size is 11 AWG.  However, as this distribution panel functions as the source to downstream loads, voltage drop to the panel should be minimized.  To minimize voltage drop, and simplify wire ordering and termination, 2 AWG will be considered.

## Chassis Ground to Lynx

All current sourced from the Aftermarket Alternator, 150A, will flow through this connection.  Its required size is bounded by that calculation.  To simplify wire ordering and termination, the same wire size will be used.

# Branch DC Wiring

