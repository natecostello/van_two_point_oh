Can use an arduino micro connected and powered via USB a device running a NUTS server to power down all comms equipment.  Micro will use [this code](https://github.com/abratchik/HIDPowerDevice).

Probably need a way to cut and restore all power to force a reset/simulate a restart of mains.

Loads:

EAP-225-outdoor 10W Expected 3W
EAP-225-outdoor 10W Expected 3W
Router 10W          Expected 5.6W
GS108E 5W           Expected 4.55W
DS 220+ NAS 20W     Expected 15W 
Cerbo 3W            Expected 3W
Pi 5W               Expected 4.5W

Expected = 38.65W at 12V = 3.22



Assuming these are powered at 12V, with a 90% efficiency, the upstream power is 68W.  

Looks like the smallest 24->12 is [120W](https://www.amazon.com/Voltage-Regulator-Converter-Waterproof-Transformer/dp/B07V9D6SF2), so no issue there.  Since there are also 120W 12->24 converters, we'd choose that size, probably [this one](https://www.amazon.com/Converter-Boost-Waterproof-Module-Transformer/dp/B09F6K6X8H).

This means auctioneering 5A at 24V.  These [diodes](https://www.amazon.com/BOJACK-Rectifier-Electronic-Silicon-Diodes/dp/B07WQY6D28) are 10A.  We'd expect them to dissipate about 3.5W at max load or 1.8 at planned full load.  Under nominal, more like a watt.

Alternative:

If we omit the 24V capability and just go with 12V, then we can use the existing 12V source and auctioneer that with the vehicle.  That eliminates two power conversion modules.  The downside is no 24V uninterupted power, but the router, synology NAS's, all run at 12V.  The EAP-225s can run as low as 10V [allegedgly](https://community.tp-link.com/en/business/forum/topic/162938).  We'd double our diode losses, but thats ok.  We need to check and see what the nominal vehicle voltage vs our house converter source is.  We woudn't want it to draw off the vehicle battery when the vehicle isn't running (we'd lose the benefit of the UPS if it was drawn down and shut off).  Think about using a NC relay that is closed upon loss of house power to allow vehicle power, like an ABT.  Depends whether the equipment has a ride though capability (enough input capacitance).

See relay design.  It precludes power from vehicle if house power is available irrespective of voltages.  Consumption with Bosch relay is less than 2W.  Using smaller relays should get power consumption down to about 0.2W.  Like [this one](https://www.mouser.com/datasheet/2/357/1/276XAXH_12D_document-3067861.pdf).

[This 5 pack](https://www.amazon.com/BOJACK-18X35-Aluminum-Electrolytic-Capacitors/dp/B08KTK8DFT) in parallel should work well for hold up capacitance with redundancy and lots of margin.  Smaller relays switch in about 10ms.

With 12V, 4 ohms would charge this bank in 1 second. Peak current is 3 Amps.  Peak power is 36W.  One of [these](https://www.amazon.com/gp/product/B075DLSC5H/) would work fine.  Total energy is 3.6J, so average over the second is 1W.  [These](https://www.amazon.com/TOUHIA-Wirewound-Ceramic-Resistor-Inductionless/dp/B07VP43ZXC) are smaller and would still work fine.

[This project box](https://www.amazon.com/Otdorpatio-Waterproof-Electrical-Electronic-200x120x75/dp/B08N1DD5WJ) fits everything.

For the above project box, it looks like the switch would sit on top of it perfectly which is a good use of space.

The stock mini running the blink sketch consumes about 4.5 mA.

As long as we size wires above the input fuse sizes on the respective sources, we don't need to worry about fusing the output before the branch circuit blocks.

12V to usb converters appear pretty ubiquitous on Amazon.  Based on this I think I'm leaning towards ditching a dedicated 5V out (saving a fuse block and large power block).

A five way terminal block would work for input and output power.  Like [this](https://www.amazon.com/dp/B08BDS8L3N/) but perhaps a lower ampacity version.

Needs on/off, vehicle source override, indication of power sources, indication of power source in use, alarm, alarm cutout.