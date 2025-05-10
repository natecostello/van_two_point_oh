---
type: article
section: van
categories: 
 # one or more categories is permitted
 - functional

title: Comms
navTitle: 
author: Nate
date: 2021-01-12
tags:
 - van
 - functional
 - concept
 - design
 - comms
 - internet
 - wifi
	# no tags
metatags:
	# no metatags
cover: 
	# image file
	# img: img
	# if attribution is needed
	# source: [vecteezy]
	# url: url
tldr:
---

## Cell

A little conflicted on whether to have an LTE Booster/Repeater inside.  We have found that cell reception does suffer pretty dramatically inside the vehicle.  However; I'm not thrilled about having a separate antenna/booster (like weboost) when we already have external antenna's for the cellular internet.  WeBoost seems to be the most common.  [Sure Call](https://www.amazon.com/stores/page/E93D848B-8085-40A6-B436-79490DDDE867?ingress=2&visitId=e1d47c44-7233-47a1-81a1-bd091e484e9d&ref_=ast_bln) is another option.

## Internet

For internet sources, we plan to rely on: 

- local wifi service from campgrounds, businesses, etc 
- Cellular/modem based internet
- Starlink if it proves workable

These sources will feed the internal wifi/hardwired network which our devices will connect to.


### Wifi As Source

TLDR:  For phase 1, we're leaning towards a ~~[Ubiquity Bullet](https://www.ui.com/airmax/bullet-ac/)~~ [MikroTik Groove AC](https://mikrotik.com/product/RBGrooveGA-52HPacn) with a dual-band SISO antenna, using a [direct DC POE injector](https://www.amazon.com/WS-GPOE-1-WM-Gigabit-Passive-Ethernet-Injector/dp/B00ENNUWO4) ~~with a 24V Buck converter (e.g. [this](https://www.amazon.com/Adjustable-Converter-1-5-35v-Efficiency-Regulator/dp/B07QKHR6PY/)) to stablize injection voltage to 24V~~.

This [website](https://seabits.com/) has a lot of information on marine based networking.  He highly recommends the [Mikrotec Groove](https://seabits.com/mikrotik-groove-step-by-step-setup-guide/) to connect to outside wifi and bridge to the internal network.  Another new option is the [Ubiquity Bullet](https://www.ui.com/airmax/bullet-ac/) which is dual band and will likely have open WRT support.  He currently uses a pepwave transit with external antennas set up for wifi-as-wan.  He also [reviewed](https://seabits.com/gl-x1200-amarok-dual-lte-router/) the Amarok discussed later.

One key requirement is to use external antenna(s) for connection to the wifi internet source.  For example, at Rodanthe Water Sports, the 2.4Ghz connection speed varied by a factor of 50 from inside to outside the van.  This antenna could be a high-gain omni or uni-directional.  Based on experiences at Frisco Woods, in Costa Rica, and Outerbanks Motel, a directional might make good sense.  

Multi-band (2.4 and 5 Ghz) MIMO directionals (or omnidirectionals) are not common.  Mulit-band SISO are available.  [Here](https://www.amazon.com/Tupavco-DB541-Yagi-WiFi-Antenna/dp/B015QEBC4W?ref_=ast_sto_dp) is a 9dBi that might work.  The [WLAN-60 by Poynting](https://poynting.tech/antennas/wlan-60/?compare=14916) is 13 dBi @ 2.4 Ghz and 18 dBi @ 5 Ghz (This is not a MIMO antenna). Its worth thinking about the fact that the highest you'll ever probably see from public wifi is 50 Mbps, so its not clear that a MIMO is warranted.

SISO 802.11n tops out at 72Mbps on a 20Mhz channel or 150Mbps on a 40Mhz channel (more likely at 5 Ghz).

SISO 802.11ac out at 433 Mbps (5Ghz only)

Note on wifi-as-wan implementation.  [This thread](https://forum.peplink.com/t/need-antenna-location-advice-metal-shell-rv/33652/3) states "While technically 'doable' to provide client wifi and wifi-as-wan using a single device - it is recommended to have a dedicated AP for client and use the Max Transit as wifi-wan. This will be MUCH more reliable and stable for clients."  This reinforces the approach of using a dedicated internal wifi access point and turning of wifi-lan on the device providing wifi-as-wan.

### Cellular As Source

One key requirement is to use external antenna(s) for connection to the cellular internet source.  This could be a high-gain omni or uni-directional.  For the cell connection, a pointable, high gain directional might make sense.  For full LTE usage, MIMO is required.  Pyonting makes a few options like [this](https://poynting.tech/antennas-accessories/antennas/farming-agricultural-antennas/xpol-2-5g/?compare=12221,12222,12223,12224) directional (11 dBi).  For MIMO, it looks like the directionals are usually panel shaped.

## Networking

Much like Van 1.0, Van 2.0 has its own internal Van Area Network, or VAN for short.  This networks allows things like our phones, laptops, sonos, etc, to all stay connected to a fixed network irrespective of the internet source (like campground wifi).

For the first several months we used the same Archer C7 running open WRT that we had used in our home and in Van 1.0.  This functions as a primary router, 4-port switch, and wifi source.

## Wifi AP

With some use of the van under our belt, we decided to improve WiFi coverage outside of the van.  The use case we are most interested in is being able to access the van's network and internet source while the van is parked and we are residing in a motel, relatives, etc.  Another is to allow us to use our sonos system outside.  To keep things simple we plan to run the same AP inside the van.

We evaluated several different options (Ubiquity, Mikrotik, and TP-Link).  We haven't been super impressed with our existing Mikrotik Groove.  The Ubiquity outdoor access points seem scarce and out of stock everywhere.  By elimination we settled on the TP-Link options.  They have a 2.4ghz BGN option called the EAP-110-outdoor and a dual band BGNAC option called the EAP225-outdoor.  Both are powered by passive 24V POE.  They both have pros and cons.  

The EAP-110 only has a 100Mbps ethernet connection and doesn't support seamless roaming.  On the positive side, the EAP-110 advertises a 3.1W draw and is $40.  The EAP-225 has a gigabit ethernet connection, supports seamless roaming, and support much faster connections.  However it advertises a 10.5W and is $70.  This one was a toughy.  Purchasing a such a limited product as the EAP-110 in 2022 seems silly, but that efficiency is very attractive.  Especially since we plan to run one inside and outside.  Going with the EAP-225 meant and extra 20 watts of constant draw if the numbers are accurate.  Even if we de-power the outdoor unit (which we might), we're still looking at an extra 10 watts to run the internal unit.  We did some digging around and found some reports on reddit of much lower actual power draw:

* [A reddit user comments here](https://www.reddit.com/r/TPLink_Omada/comments/w3t993/comment/ih1rk9h/) says they've never seen power consumption over about 3W for their EAP225.

* [A reddit user comments here](https://www.reddit.com/r/HomeNetworking/comments/p5setb/comment/h9cfqt1/) says their EAP225 idles at about 3 Watts.

Since the EAP225 actual draws are in the ball park of the EAP-110, we decided to go that route.  One open questions is whether the devices can be powered directly by the 24V system.  We'll do some testing to verify 12V power, 24V power, and 28V power.  To get fast seamless roaming, the TP-link controller must be present.  It can be run in a container on an rPi.

## Switch

To allow for expanding our network, we need a switch.  We're looking at two APs (one ethernet port each), a router (potentially consuming two ethernet ports), a wifi-as-wan source (one ethernet port), starlink (one ethernet port), the Victron Cerbo (one ethernet port), our logging rPI (one ethernet port), and our media rPi or future NAS (one ethernet port).  For our initial topology, we'll use our existing TP-Link Archer C7 to aggregate our internet sources (wifi-as-wan and starlink).  This leaves a need for a switch with six or more ports.  We also need VLAN support it must run on 12V or 24V power.  That second constraint eliminate options from D-Link and TP-Link.  We strongly considered the MikroTik CSS610-8G-2S+IN, which we could power direct from the battery, but decided against because we don't need 10G SFP+ and its advertised power usage was higher than the other alternative.  We settled on the NetGear GS108E.  It's got VLANs, is powered from 12V, and has a maximum advertised draw of 4.45 watts.  It's also only $40.

In the future, if we ditch our C7 we'll probably pick up another 5 port switch for the internet sources and one router connection.  We'd run the second router connection to the 8-port switch above.



### Integration

How to Integrate the sources and internal network is an open question.  

Pepwave has several potential devices.  It also allows central management of the devices (e.g., using a [Transit Max](https://www.peplink.com/products/transit-series-max-transit/) in conjunction with an [AP Rugged](https://www.peplink.com/products/ap-one-series-rugged/) will allow the Transit Max to manage the AP).  It is expensive.

The GL iNet [Amarok](https://www.gl-inet.com/products/gl-x1200/) which can house two separate LTE modems driven by external cellular antennas and take in a wifi source via its own antennas using travelmate or via the WAN port driven by the Bullet or Groove.  It also has LAN ports.

The Ubiquity [EdgeMax](https://www.ui.com/edgemax/comparison/) series supports multi-wan with balancing and failover.  Prices are pretty reasonable.

Could also just use any device with good open-wrt support and run it using multwan.  This might be the most customizable.  Many cheap GL.inet devices could work.  The Amarok could also do it.  Looking at other GL.inet devices, no others seem to have dedicated external antennas inputs (two for MIMO, one for internal WiFi) and at least three ports (one for the wifi source, one for Starlink, and one LAN to connect to switch).

### Cables and Accessories

If running from an internal device to an external antenna plan for good cable like LMR400 or better.  For roof pass throughs, a few of [these boxes](https://www.amazon.com/LeMotech-Waterproof-Dustproof-Universal-230mmx150mmx87mm/dp/B07G5CQV95/ref=sr_1_7?dchild=1&keywords=LeMotech&qid=1608251153&sr=8-7) installed [like this](https://www.rvwithtito.com/articles/run-cable-through-rv-roof/) or something similar should work.  The pass through boxes should probably be tucked under the rear most solar panel.  DON'T forget to account for them in the roof rack order.

## Radio

### Mobile 2M Ham

Will want mobile 2M ability.  Probably something with DMR capability if Hatteras is any indication. [This Anytone](http://www.dmrfordummies.com/anytone-at-d578uv-pro-product-review/) is probably the best (DMR + analog) out right now.  Might want to use with handheld for downwinders (but need soph to get licensed) ([Anytone also makes some waterproof VHF/UHF DMR handhelds](https://www.passion-radio.com/dmr-equipment/d868uv-751.html)).

### Semi-Mobile Ham

Would be cool to be able to deploy a larger antenna for HF bands when stationary for some amount of time.

### GMRS

May want to consider a mobile GMRS to use with handhelds (wouldn't require soph to get Ham licensed).

## Weather

Probably want a [tempest](https://weatherflow.com/tempest-weather-system/) or something similar.  And they have an [API](https://weatherflow.github.io/Tempest/api/).

## Tanks

[This covers a well reviewed easy to interface freshwater tank sensor](https://livelikepete.com/fresh-water-tank-level-sensor-and-gauge-install/).

[This should take care of an LPG tank](https://www.amazon.com/Manchester-Tank-G12846-LP-Gas/dp/B003D3WPGS/ref=pd_sbs_4?pd_rd_w=etHKf&pf_rd_p=ed1e2146-ecfe-435e-b3b5-d79fa072fd58&pf_rd_r=AXKXCG2N3KMHDTZ6BQQ5&pd_rd_r=38593e48-8fb0-48be-a0dc-9a879f51b0b6&pd_rd_wg=yntO2&pd_rd_i=B003D3WPGS&psc=1).

Both of the above would easily be integrated into signal K.

## MISC Equipment Monitoring

Will leverage signal K.  This [sensor package](https://www.seeedstudio.com/Grove-10A-DC-Current-Sensor-ACS725-p-2927.html?utm_source=blog&utm_medium=blog) looks great for current monitoring.

