1-1-2022
identified the location for the espar and drill location.
verified intake spacing per manual (30mm)

1-2-2022
Soph drilled the 5 inch espar hole (and large electrical/wakespeed pass through holes)
Primed all holes
Installed plate (with screws and vhb)
Urethaned bottom of plate
Soph caulked edges
We installed heater (nuts we used were 10mm flat-to-flat - so probably M6)

Notes on tank drop:

[Gregoryx's post](https://www.fordtransitusaforum.com/threads/sauntur-4-season-multi-sports-rig-2020-el-hr-awd-eb-raise-lower-bed-slide-out-garage-removable-full-galley-shower.86896/post-1135578)

[Ellie in Transits post](https://www.fordtransitusaforum.com/threads/espar-m2-b4l-transit-install-standpipe-install-webasto-vs-espar.88175/)

1-13-2022
Dropped tank and installed espar pickup.
Used ramps to gain clearance.
Very difficult to locate where it won't interfere with connectors on top of sender and float (and nut can be tightly threaded on).  Used location similar to gregoryx.  Should have looked under sender first.
Intended to cut 2.5 inches off following gregorx, but saw kicked and bend standpipe, so cut back to un bent portion, resulting in a total of 4 inches vs 2.5 inches cut off.  This proably puts us near 1/4 tank cut off , but will ultimately test.



[Sprinter source on pump polarity](https://sprinter-source.com/forums/index.php?threads/46748/): It doesn't matter.

Looking at various install instructions: There seems to be a lot of variability in the kits for fuel line size, color, adapter size, hose clamp size...etc.  But in the end it all worked.

Also, wire colors for pump at least are wrong in most recent wiring diagram (are green on our model)

1-14-2022
Installed intake, exhaust, fuel line and pump
Pinned all connectors
Tested with Riden power supply - SAT

Notes on remote start:
[aftermarket product here](https://www.fordtransitusaforum.com/threads/heater-with-remote-start.88462/#post-1155829)
[short yellow to red for water heater models](https://www.fordtransitusaforum.com/threads/esper-heater-can-or-relay-to-turn-on-remotely.88353/post-1154139)

Lots of stuff in the [extras manual](espar-extra-functions.pdf) including a note that suggests yellow would work for the airtronics on page 8.

It looks like the CANBus can be tapped off the main harness at the end of the connection to the Easy Start Pro.  There is a terminator attached during install with a jumper bridging two connections.  I'd be willing to bet that it is the standard 120 Ohm termination resistor.  The connector type at this location is a [DUETSCH DT type](https://www.fordtransitusaforum.com/threads/assistance-w-espar-b4l-m2-wiring-harness.85171/post-1118846). 

DT04-4P DT04-4S, available from [nedirect.com](https://www.northeastdirect.com/products/4-pin-deutsch-dt04-4s-dt06-4s-waterproof-electrical-connector), who also has an ebay store with free shipping.  Amazon options looked counterfeit.  We ordered from the ebay store.

From the wiring diagrams the CANBus is also fed to the Diagnostic Port off the main harness near the heater itself.  I'm having trouble finding the connector type for this connection.