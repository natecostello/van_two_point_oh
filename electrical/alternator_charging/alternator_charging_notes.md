---
section: "van"
category: "electrical"
title: "Alternator Charging"
author: "Stello"
date: "2020-10-26"
tags: ["24V", "design", "concept", "electrical", "van", "alternator", "charging", "factory"]
---


### Factory Alternator Charging

One limitation of the Multiplus Compact is that it only includes one auxilliary input.  Since this input will be consumed by the hardware backup for low temperature charge protection, no additional inputs are available to use to limit input current when the unit is being powered from the factory alternator via the alternator-inverter.

However, the [Digital Multi Control GX Panel](https://www.victronenergy.com/upload/documents/Manual-Digital-Multi-Control-GX-Panel-EN-NL-FR-DE-ES.pdf) (DMC panel) which is used to remotely control the Multiplus, including setting an input current limit, includes a dry contact input that can be used to impose an alternate current limit when exposed to a closed external contact.  Two potential control schemes for consideration:

1. When powered from the alternator-inverter, aux contacts from the transfer switch will be used to impose a current limit that is low enough that alternator temperatures will be maintained healthy under all conditions (e.g. hot ambient, idle).
2. When powered from the alternator-inverter, alternator temperature will be sensed and a control device (e.g. esp32, arduino, etc) will close a dry contact to impose a lower current limit upon reaching a factory alternator temperature limit.  Upon recovery from the high temperature condition, the contact would be opened allowing more rapid charge.

If case 2 is pursued, the main current limit selected by the DMC panel must be within the capacity of the alternator and alternator-inverter.  This is probably not an issue as there is rarely a reason to ever set the DMC Panel current limit above 15 Amps: 

 1. A current limit of 15 Amps will minimize trips when driveway surfing.  

 2. The max charge current of the Multiplus Compact is 50 Amps which corresponds to 13.3 Amps on the AC input side (50A * 28.8V * 0.9 / 120V).

To maximize flexibility if using case 2, a 2000W alternator-inverter should be used.

Because the conservative current limit is imposed by a closed contact, a broken wire will prevent imposing a reduced current limit.  If case 2 is pursued, a secondary function of the control device would be to shutdown the alternator-inverter if reaches a temperature that warrants backup protective action.



