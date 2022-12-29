Can use an arduino micro connected and powered via USB a device running a NUTS server to power down all comms equipment.  Micro will use [this code](https://github.com/abratchik/HIDPowerDevice).

Loads:

EAP-225-outdoor 10W
EAP-225-outdoor 10W
Router 10W
GS108E 5W
NAS 20W
Cerbo 2W
Pi 5W

Total: 62W

Assuming these are powered at 12V, with a 90% efficiency, the upstream power is 68W.  

Looks like the smallest 24->12 is [120W](https://www.amazon.com/Voltage-Regulator-Converter-Waterproof-Transformer/dp/B07V9D6SF2), so no issue there.  Since there are also 120W 12->24 converters, we'd choose that size, probably [this one](https://www.amazon.com/Converter-Boost-Waterproof-Module-Transformer/dp/B09F6K6X8H).

This means auctioneering 5A at 24V.  These [diodes](https://www.amazon.com/BOJACK-Rectifier-Electronic-Silicon-Diodes/dp/B07WQY6D28) are 10A.  We'd expect them to dissipate about 3.5W at max load or 1.8 at planned full load.  Under nominal, more like a watt.

Alternative:

If we omit the 24V capability and just go with 12V, then we can use the existing 12V source and auctioneer that with the vehicle.  That eliminates two power conversion modules.  The downside is no 24V uninterupted power, but the router, synology NAS's, all run at 12V.  The EAP-225s can run as low as 10V [allegedgly](https://community.tp-link.com/en/business/forum/topic/162938).  We'd double our diode losses, but thats ok.  We need to check and see what the nominal vehicle voltage vs our house converter source is.  We woudn't want it to draw off the vehicle battery when the vehicle isn't running (we'd lose the benefit of the UPS if it was drawn down and shut off).  Think about using a NC relay that is closed upon loss of house power to allow vehicle power, like an ABT.  Depends whether the equipment has a ride though capability (enough input capacitance).

See relay design.  It precludes power from vehicle if house power is available irrespective of voltages.  Consumption with Bosch relay is less than 2W.  Using smaller relays should get power consumption down to less than 0.4W.