---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Wire Size
author: Nate
date: 2021-03-20
tags:
 - wirin
 - design
 - final
 - electrical
 - van

metatags:
 # nothing
cover: 
	# image file
	# img: img
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---


The following evaluation assumes wire with insulation rated to 105C based on [this chart](http://assets.bluesea.com/files/resources/reference/21731.pdf) and voltage drop calculations based on [this calculator](https://www.calculator.net/voltage-drop-calculator.html?material=copper&wiresize=4.132&voltage=24&phase=dc&noofconductor=1&distance=6&distanceunit=feet&amperes=42&x=50&y=23).  [This chart](http://assets.bluesea.com/files/resources/newsletter/images/DC_wire_selection_chartlg.jpg) is also useful for quick reference.

It also assumes the BMS is using CAN to communicate/control discharge.  Based on this, it will provide 0A allowable discharge commands when the BMS cell low voltage protection of 2.9V (pack voltage of 23.2V) is reached.

This [website](http://nepsi.com/resources/calculators/short-time-current-rating-of-conductor.htm) provides a calculator for short term overload conditions.

# Main DC Distribution Wiring

## Battery to Positive Bus
TLDR: Per the main contactor instruction manual, we must use 0000 to obtain adequate continuous ampacity. 

Maximum theoritical/ideal charging current is 280A as limited by the BMS (322A is full capacity of all sources).  Round trip wire length is approximately 3 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 00 AWG.

* Battery at minimum 22.4V (BMS cell low cutoff of 2.8V)
* Max Aftermarket Alternator Charging = 180A
* Max Multiplus 24/3000 Charging = 70A
* 800W Primary Solar Charging (perfect efficiency) = 36A
* 800W Ground Array Solar Charging (perfect efficiency) = 36A

Maximum two-minute discharging current is 316A (during Multiplus overload).  Round trip wire length is approximately 3 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 00 AWG.

* Battery at minimum 23.2V (BMS cell low voltage protection of 2.9v)
* No Aftermarket Alternator Charging
* No Solar
* No Shore Power
* Max Multiplus 24/3000 Discharge = 275A (see below)
* Max DC Load Discharge = 41A (see below)

Maximum continuous discharging current is 179A.  Round trip wire length is approximately 3 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 3 AWG.

* Battery at minimum 23.2V (BMS cell low voltage protection of 2.9v)
* No Aftermarket Alternator Charging
* No Solar
* No Shore Power
* Max Multiplus 24/3000 Discharge = 138A (see below)
* Max DC Load Discharge = 41A (see below)

### Sharpening the Pencil

The maximum charging case is conservative because it assumes no loads are running, perfect solar, perfect backup solar, and ideal alternator charging.  The Nation's datasheet suggests more like 140A.  Additionally, the factory alternator will likely be limited to cover edge cases to about 68A.  This brings the max charging current to below the 285A ampacity limit for 0 AWG wire.

The maximum continuous discharge case of 179A is well below the 230A limit for 75C rated cable, which implies the wire temperatures would remain well below 75C under the maximum discharge case (assuming 30C ambient).  However, we will be using 105C rated wire.

Assuming the wire size used is 0 AWG, the initial wire temperature is 75C, and the overload current is 316A, the overload calculator predicts 133 seconds to reach a wire temperature of 105C.  This calculation is conservative because it treats the conductor as adiabatic.  In short, by using 105C rated 0 AWG (or higher) wire, the two-minute overload case is not controlling.

The problem is coordinating the battery fuse with the downstream fuses.  Without solid data on class-T long term blow curves, it may not be possible to thread the needle between protecting 0 AWG at less than 285A and ensuring the battery fuse does not clear before the 300A Multiplus fuse (see below).  For this reason we will likely need to upsize to 3/0 or 4/0 wire and employ a 350A or 400A class T fuse for the battery.  

### Main Contactor Limits

The [Blue Sea 7717 Remote Battery Switch](blue-sea-7717-rbs.pdf) specifies 0000 wire to handle 300A continuous current.  Use of 00 would limit continuous ampacity to 225A.



## 24V Alternator to Positive Bus

Maximum charge current is ~180A with the APS option.  Nominal cruise (1800 Engine RPM) is ~ 175A.  Round trip wire length is 50 ft based on our prototyped route with some margin.  Final length is likely 48 ft. By ampacity, minimum wire size is 4 AWG.  By voltage drop, assuming 3% allowable, taking credit for likely final round trip and cruising RPM output, 2/0 is barely sufficient at 26.6V.

## Multiplus 24/3000 Inverter/Charger to Positive Bus [Alternate]

Maximum charge current is 70A, and thus not limiting.

Maximum discharge current is 138A assuming minimum battery voltage (23.2V), rated power (3000W), and maximum efficiency (94%).  Round trip wire length is approximately 11.5 ft.  Wire size is limited by voltage drop. Minimum wire size is 6 AWG.

Maximum discharge current is 275A assuming minimum battery voltage (23.2V), peak power (6000W), and maximum efficiency (94%).  Round trip wire length is approximately 11.5 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 0 AWG.

Note: This is extremely conservative.  The 6000W rating is a [2 minute overload capability](https://community.victronenergy.com/questions/21511/overload-duration-on-multiplus.html).  While this case will be accommodated in the cabling (and fusing), for things like busbar sizing, continuous rates will be used (i.e., 150A busbars will be considered with the Multiplus connection adjacent to the battery connection).

The Multiplus 24/3000 Manual recommends a 300A fuse and 0 AWG wire.  The 300A fuse will give a little headroom for riding through overload conditions.  We will be using a MEGA/AMG fuses for this application.  Based on looking at 300A rated MEGA/AMG fuses from [bussman](bussmann-amg-fuse-spec-sheet.pdf) and [littlefuse](littelfuse-mega-datasheet.pdf), both should limit well below 300A (e.g., littlefuse has a 300A fuse blowing at 242A at ~70 F ambient).  Based on this data we are comfortable with a wire size as small as 0 AWG even though its ampacity (285A) is below the fuse rating.


## Solar MPPT to Positive Bus

For future flexibility, a ground array up to 800W is assumed.  This will use a second MPPT that will be paralleled with the primary roof array of 800W at a terminal, and then routed to the Positive Bus.  Wiring from the point of parallel to the Positive Bus and the branch to the MPPTs will be sized for the same ampacity to allow use of a single fuse in the Positive Bus to cover wire including the branches.

Maximum charge current is 72A assuming minimum battery voltage (22.4V) and perfect MPPT efficiency.  Round trip wire length is approximately 11.5 ft.  Wire size is limited by ampacity, not voltage drop.  Minimum wire size is 8 AWG.  We'll use 8 AWG between the main positive bus and the split to each MPPT.  We'll also use 8 AWG from the split up to the MPPTs which will allow protection from the fuse at the main positive bus.  This is also common with the Main DC Panel wiring below.
## Main DC Panel to Positive Bus

Maximum discharge current is 41A based on the maximum load (944W) in the converter sizing study in [this spreadsheet](https://docs.google.com/spreadsheets/d/1X7njD1I48CtzVDgUu9Sp_Ce2chWM4oQiqM1aEl7uJWI/edit?usp=sharing) assuming minimum battery voltage (23.2V).  Round trip wire length is approximately 12 ft.  By ampacity, minimum wire size is 12 AWG.  By voltage drop, minimum wire size is 11 AWG.  However, as this distribution panel functions as the source to downstream loads, voltage drop to the panel should be minimized.  To balance minimizing voltage drop with using common sizes with other circuits, 8 AWG will be used for this run.

## Chassis Ground to Positive Bus

All current sourced from the Aftermarket Alternator, 150A, will flow through this connection.  Its required size is bounded by that calculation.  To simplify wire ordering and termination, the same wire size will be used.
TODO: Account for factory alternator charge if main negagtive bus is grounded by line back to engine block/second alterntor.


# Alternator-Inverter DC Wiring

The alternator inverter will be powered from CCP2 which is fused at 175A.  Wire size will be limited by ampacity.  Minimum wire size is 3 AWG, which really means 2 AWG.

# Branch Wiring

Refer to separate article on circuits for branch wireing.
