Notes:


Notes on Mounting/Install:

Our current plan is to stow starlink during travel and setup when at a campsite for an extended period of time.

Storage: Initially, we'll use the husky 12 gallon container that has been used by other successfully (much cheaper than the pelican 610 option).

Storage Components:
* [Husky 12 Gal container]()

Deployed:
Dishy will sit atop a [Flag Pole Buddy]() using an [adapter bushing]().  The lowest element of the flag pole will be mounted using this [pole-to-pole mount]() to the vertical element of the aluminess passenger door carrier.  The pole-to-pole mount was selected based on the diameter of the lowest flag pole element (just over 2") and the aluminess tubing (1.625").  We considered the Harbor Freight telescoping flag pole but have decided against it based on reported failures of the telescoping mechanism.

Dishy's cable, left long enough to fully extend the flagpole, will be reterminated with a shielded RJ45 connector.  This will plug into a waterproof RJ45 shielded coupler installed in the roof pass through box.  A shielded cat6 cable will run from the inside of the roof pass through box to the POE box located in the "network closet".

Deployed Components:
* [Harbor Freight 20ft telescoping flag pole](https://www.harborfreight.com/20-ft-telescoping-flag-pole-kit-64342.html)
* [adapter bushing](https://www.etsy.com/listing/1223120087/starlink-dishy-v3-rectangular-pole-mount)
* [pole-to-pole mount](https://www.3starinc.com/heavy-duty-antenna-pipe-to-pipe-mount-1-50-to-2-75-od.html)
* [roof-pass-through box](https://www.amazon.com/gp/product/B089LLX8RK/)
* [Shielded 25ft 23AWG CAT6 run from POE Box to roof pass-through x3](https://www.amazon.com/Ethernet-IMONTA-Resistant-Waterproof-Buried-able/dp/B0714FJBTW/).  The extra two runs will be used for other applications (e.g., wifi-as-wan, external wifi AP).


POE Box:
The POE box will receive 24V power via a barrel connector.  It will contain a 24-48V (or 24-56V) boost converter.  It will have a rocker switch to cut power to the boost converter and all downstream components.  The boost converter will provide 48V (or 56V) to a [DishyPowa POE injector](https://dishypowa.com/).  The POE box will contain two RJ45 sockets, one for the router, and one for data + POE to dishy.  The DishyPowa injector will perform wire swaps needed for dishy power.

POE Box Components:
* [Project box](https://www.amazon.com/LeMotech-Plastic-Electrical-Project-Junction/dp/B07D23BF7Y/).  This box is large enough to contain all components (with converter mounted on top).
* [24-48V converter](https://www.amazon.com/gp/product/B089M7FVLJ/).  This converter can supply sufficient power.
* [Shielded RJ45 couplers](https://www.amazon.com/gp/product/B09XM37H79/)
* [Rocker switch](https://www.amazon.com/gp/product/B08R5PLDBP/?th=1). 20AWG pigtails which are sufficient.
* [Barrel connector](https://www.amazon.com/gp/product/B091PS6XQ4/). 18AWG pigtails which are sufficent.
* [Shielded Cat5e RJ45 terminations](https://www.amazon.com/gp/product/B00VYA6DKQ/). These are the same used in the facebook guide to reterminate dishy.  We will also use dishy cable to make the two Cat5E jumpers.
* [RJ45 Strain relief boots](https://www.amazon.com/gp/product/B01LYLGWSY)





XX-XX-2022
setup and used starlink for the first time

8-6-2022
Notified of availability and ordered DishyPowa POE injector.