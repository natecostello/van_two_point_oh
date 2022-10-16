Notes:


Notes on Mounting/Install:

Our current plan is to stow starlink during travel and setup when at a campsite for an extended period of time.

Storage: Initially, we'll use the husky 12 gallon container that has been used by other successfully (much cheaper than the pelican 610 option).

Storage Components:
* [Husky 12 Gal container]()

Deployed:
Dishy will sit atop a [Flag Pole Buddy](https://flagpolebuddy.com/ols/products/httpsflagpolebuddycomolsproductshttpsflagpolebuddycomolsproductsstarlink-kit-2nd-generation).  The lowest element of the flag pole will be mounted to the vertical element of the aluminess passenger door carrier.  Flag Pole Buddy doesn't have an off-the-shelf adapter to mount to a the aluminess tubing (1.625").  Based on a call they asked that I email the dimensions (sasia@flagpolebuddy.com) and they'd pass them to thier designer and get back to me. Flag Pole Buddy reached out on 10-14-2022 and stated that the designer made custom "caps" suitable for the Aluminess tube dimensions.  Place order, in the "special instructions" section add: "Need aluminess ladder modification caps".

We considered the Harbor Freight telescoping flag pole but have decided against it based on reported failures of the telescoping mechanism.

Dishy's cable, left long enough to fully extend the flagpole and use the original stand, will be reterminated with a shielded RJ45 connector.  This will plug into a waterproof RJ45 shielded coupler installed in the roof pass through box.  A shielded 23AWG cable will run from the inside of the roof pass through box to the POE box located in the "network closet".

Deployed Components:
* [Flag Pole Buddy Starlink Kit](https://flagpolebuddy.com/ols/products/httpsflagpolebuddycomolsproductshttpsflagpolebuddycomolsproductsstarlink-kit-2nd-generation).
* [roof-pass-through box](https://www.amazon.com/gp/product/B089LLX8RK/)
* [Shielded 25ft 23AWG CAT6 run from POE Box to roof pass-through x3](https://www.amazon.com/Ethernet-IMONTA-Resistant-Waterproof-Buried-able/dp/B0714FJBTW/).  The extra two runs will be used for other applications (e.g., wifi-as-wan, external wifi AP).


POE Box:
The POE box will receive 24V power via a #8 terminal block.  It will contain a 24-48V (or 24-56V) boost converter.  It will have a rocker switch to cut power to the boost converter and all downstream components.  The boost converter will provide 48V (or 56V) to a [DishyPowa POE injector](https://dishypowa.com/).  The DishyPowa POE injector within the box contains two RJ45 sockets, one for the router, and one for data + POE to dishy.  The DishyPowa injector will perform wire swaps needed for dishy power.  

I was unable to find a 24V-56V converter with decent efficiency (>90%).  There are several 24-48V options available.  We'll try that and see if we have any problems.

POE Box to Roof Gland:
* [23AWG shielded ethernet cable 25ft](https://www.amazon.com/GearIT-Cat6-Outdoor-Ethernet-Cable/dp/B0874799NB?th=1).

POE Box Components:
* [Project box](https://www.amazon.com/LeMotech-Stainless-Waterproof-Electrical-Electronics/dp/B09T6NFRXH/?th=1).  This box is large enough to contain all components (with converter and switch mounted on lid).  68mmx99mm Internal.
* [DishyPowa](https://dishypowa.com/). 51mmx72mm
* [24-48V converter](https://www.amazon.com/gp/product/B089M7FVLJ/).  This converter can supply sufficient power. 74mmx72mm.  Mounted (VHB) to lid of box.
* [Rocker switch](https://www.amazon.com/gp/product/B08R5PLDBP/?th=1). 20AWG pigtails which are sufficient. 20mm diameter.
* [Terminal Block](https://www.amazon.com/Blue-Sea-Systems-Circuit-Terminal/dp/B0000AZ6TZ/ref=sr_1_1?crid=6CQF0J3PKDX9&keywords=2502%2Bblue%2Bsea&qid=1665509883&qu=eyJxc2MiOiIwLjg4IiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&s=industrial&sprefix=2502%2Bblue%2Bsea%2Cindustrial%2C138&sr=1-1&th=1&psc=1).  #8 terminals 54mmx34mm.  Mounted (VHB) to underside of lid of box.

Roof Gland Box:
* [Shielded RJ45 couplers](https://www.amazon.com/gp/product/B09XM37H79/)


Starlink Mounting:
The stem can tuck under/behind the rear crossbeam to minimize the height of the antenna.  With this arrangement, the surface of the unit need only rise 2" above the top of the rack sides and crossbeams.  This can be accomplished by building a rectangle with aluminum angle with dimensions that match the outline of the antenna (12" by 20.25")

6063 angle is available from metals supermarket in 2x1x0.125" (long) and 1.75x1.75x0.125" (cross).  The cross pieces would bolt to the long with 1/8" spacers to flush the top edges.  Estimated weight using 1/8" is 3 ~lbs (7.3' x 0.42).  See sketchup model.  Plan to use velco straps to fasten.  Anchor velcro webbing with [these](https://www.mcmaster.com/8030T11/).

XX-XX-2022
setup and used starlink for the first time

8-6-2022
Notified of availability and ordered DishyPowa POE injector.