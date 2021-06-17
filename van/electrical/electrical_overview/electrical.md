---
type: categorypage
section: van
categories: 
 # one or more categories is permitted
 - electrical
 - magical

title: '"concerned with electricity"'
navTitle: Electrical
author: Nate
date: 2020-10-26
tags:
	# no tags
metatags:
	# no metatags
cover: 
	# image file
 img: rando-van-elec.jpeg
	# if attribution is needed
 source: Van One Point Oh
	# url: url
---

The van electrical system consists of DC and AC portions.  The DC portion is primarily 24V with a 24V 560 AH LFP battery and directly supplies 24V loads and uses power conversion to supply 12V loads.  The AC portion is 120V at 60 Hz and supplies all AC loads.  Connecting the AC and DC portions is an inverter/charger that can supply DC power or AC power.  The system is capable of using and storing power from solar panels installed on the roof, a shore power connection, the factory alternator, and a dedicated alternator.  

![Electrical Schematic](schematic.svg)
_High level system schematic_

## System Goals

We designed our electrical system with two goals:

* The **first goal** of the system is to store enough power from solar to supply all normal day-to-day loads without needing to plug in or run the engine for as many days as possible, ideally indefinitely.  This is a pretty standard boring goal.

* The **second goal** of the system is to provide enough storage and charge capability to allow overnight use of air conditioning with minimal engine based charging time.  This goal is what makes things interesting.

Safety Third: There is a third, implicit goal of doing the two jobs above safely, reliably, and servicably.  To the maximum exent possible, ABYC requirements were leveraged in the design.  While its not a boat, it has enough in common that the requirements carry over.

Keep these goals in mind as you read on...we will frequently refer back to them.

## Battery

The core of our electrical system is a 560AH-24V battery composed of 16 lithium-iron-phosphate (LFP) cells managed by a REC Q Battery Management system.  For the details that got us there, read on.

To support both system goals, we planned to install as much battery capacity as possible without being ridiculous.  A lot of this came down to cost, weigh, and size.  It goes without saying that we planned to use LFP based battery based on our experience with Van 1.0 and the fact that Non-LFP batteries will not meet our goals (charge rate and capacity).  The limitations of lead acid and AGM vs LFP are widely covered elsewhere if you google around.

Given LFP, the choice is then whether you buy an off-the-shelf product, or roll your own.  These days there are some great, proven products (e.g., Battleborn).  However, for the capacity we are looking for, a product like that is cost-prohibitive.  For perspective, for where we landed on capacity, it would have been about 4 times more expensive.

So we will/did roll our own LFP battery.  If you are considering this path yourself, buckle up and take a lot of time to read through the incredible information available from Will Prouse's forum: [diysolarpower.com](diysolarpower.com).  Its a deep but rewarding hole.

We settled on a battery built from 280AH LFP cells that are in heavy production and available from China.  Based on size, weight, cost, and system constraints, we settled on 16 cells.  Battery sizing is somewhat discrete.  The "next step" up in capacity would mean a 20 cell system (or more for a 24V or 48V system) which would eat too much of our under bed storage.  

With the cells and number of cells decided, we our order and began designing all the things to turn those 16 cells into a battery.  [All the details of the battery physical design can be found in this article.](/van/electrical/battery/Battery_box_design_final)  If that isn't enough you can read about the alternative concepts and calculations that led the final design [here](/van/electrical/battery/Battery_box_design) and and a half-baked abandoned concept [here](/van/electrical/battery_box_deprecated/Battery_box_design).

If you roll your own LFP battery, you have to provide a Battery Management System (BMS).  The secondary goal mean we needed a BMS with external charge/discharge cutoff.  Based on our Van 1.0 experience we wanted a BMS that was reasonably open source.  This led us two consider two products, the Orion Jr and the REC Q.  Either would work, we opted for the REC Q because it seems to be the path more traveled when it comes to integrating with a Victron ecosystem of components.  I can't speak for the Orion, but the REC Q is bomb-proof and has been a pleasure to tinker with.  [All the details of integrating the REC Q with the rest of the system to ensure the battery is adquately protected can be found in this article.](/van/electrical/BMS_wiring_logic/REC_Q_BMS_Wiring_Logic)


## DC System Voltage

**Our battery and primary DC system voltage is 24V.  Read  on  for the rational that  that led us to that decision.**

Most vans out there are 12V these days.  Our first van was based on a 12V DC system.  If you aren't exceeding roughly 3000W charge or discharge, 12V systems make a lot of sense and are simple to design and build.  

However, because of our secondary goal, we want more than 3000W charge capability.  A good starting place if you are maximizing charge rate, is to aim to achieve a 0.5C, the limit for most LFP cells.  For the battery capcity selected this equates to 280A with a 24V battery or 140A with a 48V battery. (Note for a 12V system that would be 560A which is a non-starter).

To obtain those kind of charge rates, a dedicated alternator operating at the battery voltage is a requirement.  Nations starter and alternator currently has a 24V alternator that fits our van and can supply about 150A.  We can make up the remainder with the factory alternator and some intervening power conversion.  Details on all this to follow.  Nations is about to release a 48V alternator that can source more than enough power.  From a charge source perspective, both 24V and 48V are feasible.  Likewise, the current for the 24V and 48V charge rates are also both managable from a cabling and fusing perspective.

The decision primarily came down how each would integrate with existing off-the-shelf components, reliability, and the effect of system voltage on base load (i.e., the primary goal).  [This article details our evaluation of 24V vs 48V for our system voltage.](/van/electrical/voltage_trade_studies/Electrical_24V_vs_48V_concepts)  In short, the 24V system is attractive because of the fans, lights, refridgerators, freezers, fuses, breakers, contactors, etc., etc., that can operate natively at that voltage.  In a 48V system everything has to be powered by an intermediate conversion stage.  That said, I think in 4 years time, I would probably be making a different decision based on where things seem to be heading.  

If you want to read old design detritus looking at the merits of 24V or 48V over a standard 12V system, you can find some [here](/van/electrical/voltage_trade_studies/Electrical_24v) and [here](/van/electrical/voltage_trade_studies/Electrical_48v).

## Solar Charging

Van 2.0 has 800W of installed solar on the roof composed of four [Rich Solar](https://richsolar.com/products/200-watt-24-volt-solar-panel) 200W panels in a 2S2P arrangement and a [SmartSolar 150/45](https://www.victronenergy.com/upload/documents/Datasheet-SmartSolar-charge-controller-MPPT-150-45-up-to-150-70-EN.pdf) MPPT.  A portable ground array, if pursued, will use a separate MPPT to maximize flexibility in panel choice (specifically dimensional flexibility).  Read on for details.

To support the **first goal**, the roof arrangement was optimized for as much solar as possible.  [This article covers physical details of those trade-offs.](/van/vehicular/roof_arrangement/roof_rack_and_arrangement_notes)  Based on these constraints, the maximum we could put on the roof is 800W.

For our panels, depending on the final configuration (e.g. 2S2P) multiple MPPT models could be used.  We opted for the Victron SmartSolar 150/45 primarily because of its remote enable/cutoff and the flexibility it provides for system integration.

[This article captures all of the details and design considerations that led to the decisions discussed above.](/van/electrical/solar/solar)


## AC, Shore Power, and Shore Power Charging


## Alternator Charging

## Load Analysis

## Circuits and Wire Size






