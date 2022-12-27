---
type: article
section: van
categories: 
 # one or more categories is permitted
 - mechanical

title: Propane System
navTitle: 
author: Nate
date: 2020-12-05
tags:
 - propane
 - mechanical
 - design
 - van
metatags:
	# no metatags
cover: 
	# image file
 img: cover.jpeg
	# if attribution is needed
 source: 
	# url: url
tldr:
---


The van will use propane for cooking.  While the electrical would be sufficient for induction cooking, our experience has been that gas is more convenient.

# Components

## Tank

TLDR: We settled on the [Go Westy 50 lb/5.9 gal tank](https://www.gowesty.com/product/-/23916/larger-capacity-lp-tank-w-level-indicator-?v=#tabs-add261).  For install and mounting details, see [this article](/van/structural/propane-mount/propane-mount).

The area occupied by the spare tire appears amenable to storage of a propane tank without any loss of ground clearence.  It also has frame features for easy bracketry work with no drilling.  There might be other locations as well.  The tank I am considering is [this 50 lb/5.9 gal tank](https://www.gowesty.com/product/-/23916/larger-capacity-lp-tank-w-level-indicator-?v=#tabs-add261).  Currently, out of stock, but was told by phone that it will be available again around the end of the month.

FarOutRide states their 20 lb (4.6 gal) propane tank used for cooking and showers every other day lasts them two months.  The above tank would yield over 10 weeks at the same burn rate.  I would expect more given no showers.  We can also use an adapter to patch in a 20 lb tank if filling up was a problem (say in Mexico).

This [thread](https://www.fordtransitusaforum.com/threads/where-to-get-an-external-propane-tank-installed.77664/) has some good information on locations to install tank.

If [these tanks](lpg-asme-toroidal-v8.pdf) are purchasable, it would work very well in the factory spare location.

## Pressure Gauge
We will use this [guage](https://www.amazon.com/dp/B01HIM6PCO?psc=1&smid=A317TR1CT4N6E9) to satisfy ABYC requirements and allow for regular system leak checks.

## Solenoid Cutoff Valve
TLDR: We settled on this [24V high pressure solenoid valve](https://centuryfuelproducts.com/afc-123-24v).  Due to its high pressure this valve can be mounted upstream of the regulator, similar to Far Out Ride's approach.  This the only 24V high pressure capable valve we could find.  Most 24V valves are only rated for low pressure.

## Regulator
Our regulator came with the tank.  It appears to be [this](https://www.gowesty.com/product/made-in-usa/2448/lpg-gas-regulator-2-stage).  The inlet side is 1/4 FNPT, by inspection.  The outlet side is 3/8 FNPT.  Since our regulator will connect to our hose, we will need a [3/8 MNPT to 3/8 flare adapter](https://www.homedepot.com/p/Everbilt-3-8-in-Flare-x-3-8-in-MIP-Brass-Adapter-Fitting-801439/207176676).


## Piping/Hose
We will use this [flexible hose](https://www.amazon.com/Trident-Marine-1014-3838-180-Supply-Fittings/dp/B000FQ1HEM/).  For a van application subject to vibration, we are more comfortable with something that won't work harden or fracture.  It is also in accordance with ABYC standards (UL listed)


## Remote Fill
A [remote fill kit](https://www.fordtransitusaforum.com/threads/nashfuel-remote-propane-fill-kit.71888/#post-955602) will probably make fill attendents a little less grumpy. We'll consider in the future.


# System Capacity
Our only system load is the oven which consumes 28100 BTU/hr full out (all burners and oven).  For our system demand, 1/4 ID pipes, hose, and valves should be sufficient for a system length up to 20ft (pressure of 11.0 inch w.c. with drop of 0.5 inch w.c.) according to NFPA Table 1315.2(29) (31KBTU/hr) and [this chart](line-sizing-charts-lp-gas-equipment.pdf) and [Far Out Ride's Table](https://faroutride.com/propane-system/#elementor-toc__heading-anchor-16) (34KBTU/hr).

This also suggests we should not need to double up on a 1/4 inch orifice solenoid as suggested by Caldor below.

# Requirements

These are taken from _Calder, Nigel; Calder, Nigel. Boatowners Mechanical and Electrical Manual 4/E . McGraw-Hill Education. Kindle Edition._ 

* Gas Locker Requirements are not applicable since the tank will be installed outside the van.

> The ABYC requires a pressure gauge immediately downstream of the main cylinder valve and before the gas regulator (the valve that reduces cylinder pressure to operating pressure—Figure 15-4F).

We will install a pressure gauge per the requirements.

> Install regulators with the vent port facing down so that water cannot collect in the vent and enter the system (Figure 15-4G).

>The ABYC states that it must be possible to shut off the main gas flow from the vicinity of the appliance without reaching over an open flame...in the United States this condition is met by installing a (normally closed) solenoid-operated master shutoff valve in the cylinder compartment, wired to a remote switch close to the appliance using the gas...The ABYC requires that this switch have a light to indicate when the solenoid is open.

We will use a solenoid shut off valve.  It will be wired powered, via a relay, from the switch on the front of the stove.  The switch is lit when power on.  This meets all the ABYC requirements.

>Although some stove manufacturers suggest installing the master shutoff valve upstream of the regulator (i.e., in the high-pressure section of line between the cylinder and regulator), most are designed to be installed downstream of the regulator...If the valve is to be installed upstream, first make sure it is suitable (i.e., rated for the pressure).

We chose a valve suitable for use on the high pressure side.

>The smaller of the two Trident valves is too small (¼ inch/6 mm) for larger stoves (three or more burners with an oven). If you use it in such an installation, you will need to plumb two valves and wire them in parallel.

See discussion on system capacity above, we should be fine with a 1/4 inch valve.

>ABYC standards state that every appliance should be served by a continuous (no connections) fuel line from the gas cylinder regulator to the appliance (or, in the case of gimballed stoves, to a length of flexible hose connecting to the appliance).

With the exception of adapter fittings located outside of the van, we meet this requirement.

>Connections at the regulator end and the appliance should be made with flare fittings.

The hose we selected is flared on both ends.

>Long-nut flare fittings are preferred over the short-nut type typically used in refrigeration (the long nut lessens the chance of fatigue failure from vibration).

We are limited by the fittings supplied on the equipment.

>If hose is used, both the ABYC and ISO require permanently attached end fittings, such as swaged terminals. In the United States, the hose should be labeled as compliant with “UL 21 LP Gas Hose”; in Europe it must meet EN1763-1 and EN1763-2, Class 2 and 3.

The hose we selected has permanently attached end fittings.

>If hose is used, both the ABYC and ISO require permanently attached end fittings, such as swaged terminals. In the United States, the hose should be labeled as compliant with “UL 21 LP Gas Hose”; in Europe it must meet EN1763-1 and EN1763-2, Class 2 and 3.

The hose we selected is UL listed.

>Securely fasten all tubing runs at least every 18 inches (50 cm), and ensure they are protected from abrasion, flexing, pinching, or knocks where equipment may bounce around in lockers.

Our fastening scheme is TBD.

>Seal all holes where tubing passes through bulkheads or decks.

The penetration into the van is oversided and grommeted.  We will use closed cell stuffing material to seal the entrance around the hose.

>If the system has a pressure gauge, test for leaks at least every two weeks, and always after changing a cylinder, as follows: 
>1. Close all appliance valves. 
>2. Open the cylinder valve and master solenoid valve. 
>3. Observe the pressure on the cylinder gauge and let it stabilize. Make a note of the pressure. 
>4. Close the cylinder valve, but not the solenoid valve, and wait 3 minutes. 
>5. Check the cylinder gauge. _If the pressure has fallen at all, there is a leak somewhere._

We will regularly test according to this procedure.