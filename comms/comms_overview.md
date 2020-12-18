# Comms Overview

## Cell

A little confliced on whether to have an LTE Booster/Repeater inside.  We have found that cell reception does suffer pretty dramatically inside the vehicle.  However; I'm not thrilled about having a separate antenna/booster (like weboost) when we already have external antenna's for the cellular internet.  WeBoost seems to be the most common.  [Sure Call](https://www.amazon.com/stores/page/E93D848B-8085-40A6-B436-79490DDDE867?ingress=2&visitId=e1d47c44-7233-47a1-81a1-bd091e484e9d&ref_=ast_bln) is another option.

## Internet

For internet sources, we plan to rely on: 

- local wifi service from campgrounds, businesses, etc 
- Cellular/modem based internet
- Starlink if it proves workable

These sources will feed the internal wifi/hardwired network which our devices will connect to.

 ### Wifi As Source

This [website](https://seabits.com/) has a lot of information on marine based networking.  He highly recommends the [Mikrotec Groove](https://seabits.com/mikrotik-groove-step-by-step-setup-guide/) to connect to outside wifi and bridge to the internal network.  Another new option is the [Ubiquity Bullet](https://www.ui.com/airmax/bullet-ac/) which is dual band and will likely have open WRT support.  He currently uses a pepwave transit with external antennas set up for wifi-as-wan.  He also [reviewed](https://seabits.com/gl-x1200-amarok-dual-lte-router/) the Amarok discussed later.

One key requirement is to use external antenna(s) for connection to the wifi internet source.  For example, at Rodanthe Water Sports, the 2.4Ghz connection speed varied by a factor of 50 from inside to outside the van.  This antenna could be a high-gain omni or uni-directional.  Based on experiences at Frisco Woods, in Costa Rica, and Outerbanks Motel, a directional might make good sense.  

Multi-band (2.4 and 5 Ghz) MIMO directionals (or omnidirectionals) are not common.  Mulit-band SISO are available.  [Here](https://www.amazon.com/Tupavco-DB541-Yagi-WiFi-Antenna/dp/B015QEBC4W?ref_=ast_sto_dp) is a 9dBi that might work.  The [WLAN-60 by Poynting](https://poynting.tech/antennas/wlan-60/?compare=14916) is 13 dBi @ 2.4 Ghz and 18 dBi @ 5 Ghz (This is not a MIMO antenna). Its worth thinking about the fact that the highest you'll ever probably see from public wifi is 50 Mbps, so its not clear that a MIMO is warranted.

SISO 802.11n tops out at 72Mbps on a 20Mhz channel or 150Mbps on a 40Mhz channel (more likely at 5 Ghz).

SISO 802.11ac out at 433 Mbps (5Ghz only)

### Cellular As Source

One key requirement is to use external antenna(s) for connection to the cellular internet source.  This could be a high-gain omni or uni-directional.  For the cell connection, a pointable, high gain directional might make sense.  For full LTE usage, MIMO is required.  Pyonting makes a few options like [this](https://poynting.tech/antennas-accessories/antennas/farming-agricultural-antennas/xpol-2-5g/?compare=12221,12222,12223,12224) directional (11 dBi).  For MIMO, it looks like the directionals are usually panel shaped.

### Integration

How to Integrate the sources and internal network is an open question.  

Pepwave has several potential devices.  It also allows central management of the devices (e.g., using a [Transit Max](https://www.peplink.com/products/transit-series-max-transit/) in conjunction with an [AP Rugged](https://www.peplink.com/products/ap-one-series-rugged/) will allow the Transit Max to manage the AP).  It is expensive.

The GL iNet [Amarok](https://www.gl-inet.com/products/gl-x1200/) which can house two separate LTE modems driven by external cellular antennas and take in a wifi source via its own antennas using travelmate or via the WAN port driven by the Bullet or Groove.  It also has LAN ports.

The Ubiquity [EdgeMax](https://www.ui.com/edgemax/comparison/) series supports multi-wan with balancing and failover.  Prices are pretty reasonable.

Could also just use any device with good open-wrt support and run it using multwan.  This might be the most customizable.  Many cheap GL.inet devices could work.  The Amarok could also do it.  Looking at other GL.inet devices, no others seem to have dedicated external antennas inputs (two for MIMO, one for internal WiFi) and at least three ports (one for the wifi source, one for starlink, and one LAN to connect to switch).

### Cables and Accessories

If running from an internal device to an external antenna plan for good cable like LMR400 or better.  For roof pass throughs, a few of [these boxes](https://www.amazon.com/LeMotech-Waterproof-Dustproof-Universal-230mmx150mmx87mm/dp/B07G5CQV95/ref=sr_1_7?dchild=1&keywords=LeMotech&qid=1608251153&sr=8-7) installed [like this](https://www.rvwithtito.com/articles/run-cable-through-rv-roof/) or something similar should work.  The pass through boxes should probably be tucked under the rear most solar panel.  DON'T forget to account for them in the roof rack order.

## HAM

### Mobile 2M

Will want mobile 2M ability.  Probably something with DMR capability if Hatteras is any indication. [This Anytone](http://www.dmrfordummies.com/anytone-at-d578uv-pro-product-review/) is probably the best (DMR + analog) out right now.

### Semi-Mobile

Would be cool to be able to deploy a larger antenna for HF bands when stationary for some amount of time.

## Weather

Probably want a [tempest](https://weatherflow.com/tempest-weather-system/) or something similar.