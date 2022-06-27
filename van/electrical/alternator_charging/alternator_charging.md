---
type: article
section: van
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Alternator Charging
author: Nate
date: 2020-10-26
tags:
 - 24v
 - design
 - concept
 - electrical
 - van
 - alternator
 - charging
 - factory

metatags:
	# no metatags
cover: 
	# image file
 img: alternator-cover.JPG
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---


**TLDR:** The APS [24V 185A alternator](185-hpi-series-high-output-alternators.pdf) will provide a ~4800KW charge rate during highway driving (70 mph) and SEIC high idle (2050 RPM) conditions.

Alternator charging using a dedicated 24V alternator will provide for rapid battery charging.  We plan to make use of Ford's Stationary Elevated Idle Control (SEIC) to maximize charge while parked and needing to charge.

## Factory Alternator Charging

Factory alternator charging was originally being considered to supplement the dedicated 24V alternator.  This could add up to ~2000W charge rate.  We elected not to implement this due to lack of need, additional complexity and weight.  See the deprecated version of this page for design information related to this option and lots of additional save-for-posterity information.

## Second Alternator Charging

Two alternators are under consideration for the second alternator charging source.  Nations, per discussions via email, can provide a [24V 150A alternator](24v-150-specs.pdf).  American Power Systems, per telephone discussion, can provide a [24V 185A alternator](185-hpi-series-high-output-alternators.pdf).

![APC vs Nations](https://docs.google.com/spreadsheets/d/e/2PACX-1vRqru6sGcCfYan_YcsX_HOuZklt7VJqWEFFhCo8bZ-fJq4Ejl9pkIvU5rtuqvRTMn369qlRagcY6kSQ/pubchart?oid=1134277159&format=image)
_Note: 630 RPM is base idle, 800 RPM is the SEIC minimum, 2050 RPM is 70 mph cruise, 2400 is the SEIC maximum._ 

### Comparison Details

The details are in this [google spreadsheet](https://docs.google.com/spreadsheets/d/1PZ28vauZOBcX5VKHcEtaARwbSTpMoWLsqBCX2Hrulv8/edit?usp=sharing). I took the data sheets for the two candidate alternators, and used a 6th order polynomial fit on the performance data points.  The crank pulley diameter is 6 inches, inferred from APS alternator test data and help from the forum.  From the polynomial fit and the respective pulley ratios, the estimated performance curves can be overlaid.  The 3.5 pulley ratio was taken from the Nations datasheet as "typical" but is not confirmed.

While the idle performance of the Nations alternator is superior, substantially higher charge rates are possible with the APC alternator under higher SEIC and cruise conditions.  On that basis, we have selected the APS.  Based on an email with Jim at APS, the APS alternator cuts off below 1905 RPM.  In a followup email he confirmed the cutoff occurs at 1905 alternator-RPM which corresponds to 650 engine-RPM.  This cutoff would predict no alternator charging at idle.  **Update:** Based on testing, this prediction is correct.  The APS option does not provide any charging at normal minimum idle.

#### Regulator

We plan to use a Wakespeed WS500 for regulation and charge control from the second alternator.  It is proven to integrate well with the REC BMS and Victron ecosystem.


