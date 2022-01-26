---
type: article
section: van
categories: 
 # one or more categories is permitted
 - mechanical

title: Plumbing
navTitle: 
author: Nate
date: 2020-12-05
tags:
 - water
 - plumbing
 - mechanical
 - design
 - van
metatags:
	# no metatags
cover: 
	# image file
 img: 
	# if attribution is needed
 source: 
	# url: url
---


## Faucet

We ended up with the [Kraus Bolden 18 inch faucet](https://www.kraususa.com/kitchen/kitchen-faucets/commercial-style-faucets/kraus-kpf-1610sfsmb.html).  We opted for this over the Sellette to ensure clearance to the overhead storage.

~~KRAUS [Sellette™](https://www.kraususa.com/catalogsearch/result/?q=Sellette) Single-Handle Pull-Down Sprayer Kitchen Faucet.~~


## Storage

We opted for 3 Scepter brand jerry cans.  These are Nato dimensions and pretty standard.

## Graywater

The sink will drain outside the van to a temporary collection bottle where needed (e.g. and empty milk jug).  A fitting like [this](https://www.dripdepot.com/item/layflat-oval-hose-insert-by-fpt-adapter-barb-size-1-half-inch-fpt-size-1-half-inch) should allow connection of the sink drain to plastic tubing.  Apparently sink drains are pretty standard with 1.5 inch female NPT thread.

## Sink

We selected the smaller varient of the Ikea Norrsjon sink.

## Pump

We considered the following 24V water pumps:

* [Shurflo 4008-131-E65](pds-4008-131-x65.pdf) which can supply 3.2 GPM and is available for ~$140 + shipping
* [Shurflo Aqua King II](pds-4138-131-x65.pdf) which can supply 3.1 GPM and is available for ~ $150
* [Shurflo Aqua King II Premium 4.0](pds-4148-163-x75.pdf) which can supply 4.0 GPM and is available for ~ $217 + shipping
* [Shurflo Aqua King II Supreme 5.0](pds-4158-163-x75.pdf) which can supply 5.0 GPM and is available for $279.98 with shipping
* [Remco 55Aquajet-AES-24](55aquajet-aes-24-spec.pdf) which can supply 3.4 GPM but cannot be found online.
* [Remco 55Aquajet-ARV-24](55aquajet-arv-24-spec.pdf) which can supply 5.3 GPM and is available for ~ $340.

We opted for the Shurflo Aqua King II Supreme.  It should have plenty of umph for sourcing a sprayer/shower.  It was backordered at most places, we ordered from AnchorExpress.com, who had the best price, but some questionable reviews and unclear stock.  We'll rant if it goes south.

## Reverse Osmosis

Eventually, given the amount of time we spend ocean side, it would be advantageous to have an RO desalinator.  DIY is doable.  The cost is the high pressure pump and drive motor, but integration looks doable.

## Tank Level Monitoring

[This product](https://milonetech.com/products/chemical-etape-assembly) looks like the cheapest out there and would be easily integrated with a esp/pi/arduinio.

## Connections

### Supply

Jerry cans will have [3/8 ID reinforced PVC hose](https://www.usplastic.com/catalog/item.aspx?itemid=44393&catid=993) that runs from the bottom of the can to a [3/8 inch barbed panel mount dripless quick disconnect insert](https://www.usplastic.com/catalog/item.aspx?itemid=40966).  The insert will be installed in a 1-1/4 inch hole cut into the larger jerry can cap (over the pour spout).

The [mating quick disconnect body](https://www.usplastic.com/catalog/item.aspx?itemid=44801) has a 1/2 ID barb and connects with [1/2 ID reinforced PVC hose](https://www.usplastic.com/catalog/item.aspx?itemid=44394) to a [1/2 inch barb elbow](https://www.usplastic.com/catalog/item.aspx?itemid=31321) and two [1/2 inch barb tees](https://www.usplastic.com/catalog/item.aspx?itemid=30043) that form a manifold that join the lines from the three jerry cans.

The manifold connects to the pump inlet with 1/2 ID reinforced PVC hose.  This connection is barbed on both ends.

The pump outlet connects with 1/2 inch hose to a 1/2 barbed tee.

The 1/2 inch barbed tee connects via two 1/2 ID reinforced PVC hoses to two [brass 1/2 barb to 1/2 inch FIP fittings](https://www.homedepot.com/p/Everbilt-1-2-in-Barb-x-1-2-in-FIP-Brass-Adapter-Fitting-800099/300096250).  These two brass fittings are connected to two [brass 1/2 in MIP to 3/8 in male compression fittings](https://www.homedepot.com/p/Everbilt-3-8-in-Compression-x-1-2-in-MIP-Brass-Adapter-Fitting-804599/304958602).

Those last two fittings connect to the faucet hot and cold supply lines, which are 3/8 female compression connections.

### Drain

The sink drain connects to a [1-1/2 inch FIP to FIP 90 degree elbow](hhttps://www.usplastic.com/catalog/item.aspx?itemid=34834) that in turn connects to a [1-1/2 to 1 inch reducing nipple](https://www.usplastic.com/catalog/item.aspx?itemid=135126) that in turn connects to a [1 inch FNPT to 1 inch barb adapter](https://www.usplastic.com/catalog/item.aspx?itemid=135154).

[1 inch ID reinforced PVC hose](https://www.usplastic.com/catalog/item.aspx?itemid=44396) runs from the above barbed connection overboard through the 1.5 inch hole added though the vehicle floor.