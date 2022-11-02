For upfitter switch use, [this forum post](https://www.fordtransitusaforum.com/threads/upfitter-switches-third-party-high-power-mode-charger-remote-on-off.86377/) is useful.

For SEIC implementation, [this forum post](https://www.fordtransitusaforum.com/threads/2020-seic-stationary-elevated-idle-control.89771/) is useful.  Note the corrections on wire color schemes.

The easiest upfitter switch(es) to use would be switches 3 and 4, the output of which are accessible from C33-H which is located behind the glove compartment box and which has a dedicated pigtail.  These signals are described in detail in the 2020 BEMM on page 169.  The output of switch 3 or 4 would be used to supply VPWR to PTO_REQUEST1 to turn on SEIC.


Signals:
* PTO_REQEUST1 (BU) - apply VPWR to initiate SEIC
* PTO_RPM (GN-WT) - Apply resistor to select desired RPM.  This signal must be distiguished from TRO-N (also GN-WT).
* PTO_VREF (GN-VT) - Powers resistor to select desired RPM.
* PTO_GND (YE-VT) - Used in the case of a poteniometer - probably a good idea.
* PTORLY (BU/WT) - low side driver that can be used to power an LED to indicate conditions for SEIC have been met and it is active.  This signal must be distinguished from CTO (Also BW-WT).

It is unclear to me from the documentation what PTO-REQUEST2 (GN) is for or if required.

If we package in a water tight project box installed in the engine compartment, the only wire that would need to pass into the engine compartment is PTO_REQUEST1 from the upfitter switch.  This is probably the way.

Potentially usefull pass throughs:
C11-H Located on drivers side in engine compartment.
C12-A Located behind left side of center stack

To use these pass throughs, we need to get a hold of:
9C24-14A411-A (C11-H pigtail)
9C24-14A411-G (C12-A pigtail)

[Alledgedly](https://www.fordtransitusaforum.com/threads/part-numbers-for-plugging-into-the-c11-h-and-c12-a-connectors.51209/post-665025) these are contained in a kit numbered: 9c24-14a351-AB

I can't seem to find anywhere to order these from.  Might check with ford.  Otherwise, may be able to use a quick connect, but would lose water seal.

If I search for that kit on on a ford site, it looks like I can order it:
https://parts.ford.com/shop/en/us/electrical/wire-looms-and-connectors/wiring-assy-6503155-1#/partMatched?pdp=y
It shows up as part number: 9C2Z13A576A associated with E series.

2022-10-28
Ordered kit 9c25-14a351-AB from parts.ford.com