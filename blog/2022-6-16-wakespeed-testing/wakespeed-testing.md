---
type: post
section: blog
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: 24V Alternator Testing
author: Nate
date: 2022-06-16
tags:
 - van
 - build
 - electrical
 
metatags:
	# no metatags
cover: 
	# image file
 img: cover.jpeg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
---

**TLDR:** The APS alternator performs pretty close to advertised performance but requires driving or high idle to supply power.  It will not source power under normal idle speed.

## Firmware and Settings

The Wakespeed has a LOT of flexibility and thus many settings.  We highly recommend spending timing reading through the content on their [technical web page](http://wakespeed.com/technical.html) paying especial attention to the "Communication and Programming Guide".

For optimal performance, you will need to determine some specific details for your alternator.  Thankfully Wakespeed has released an [ios app](https://apps.apple.com/us/app/wakespeed/id1526101154) that will produce a base configuration file specific for the APS 185 amp alternator.  The configuration it produced for us is [here](ALTREG.txt).  We annotated the meaning of the configuration parameters, and noted required changes in this version [here](ALTREG-annotated.txt).

Because we wanted our Victron system to be able to read data from the Wakespeed, we needed to upgrade its firmware to the latest beta version (2.5.0).  This version is available on their technical page.  Details about this ability can be found in this [github comment thread](https://github.com/victronenergy/venus/issues/779).

We updated the Wakespeed configuration file (manually) to add a few new parameters for firmware 2.5.0 and made a few changes for our specific configuration and conservatism.  The modified configuration file is [here](ALTREG-2022-6-16-v-1.0.txt) with annotations [here](ALTREG-2022-6-16-v-1.0-annotated.txt).  Aside from changes related to our configuration, we reduced the alternator temperature limit from 120C to 100C for conservatism.  One motivation is that this alternator is directly lugged to a 2/0 cable with an insulation rating of 105C.  Another is that for any electrical equipment, cooler operation equates to longer life.

We used the Wakespeed Universal Configuration Utility (a batch file) to update the firmware and upload the initial configuration.  We're a Mac household so we used a free Windows 10 image running on VirtualBox to run the utility.  It was relatively painless (we did need to play with some USB settings to ensure the virtual machine was passed the Wakespeed USB device by default from the host machine).


## Initial Light-off

We started the engine and observed via our Victron system a decent charge current with RPM above base idle.  Success!  

## Logging Capability

We fired up our loggingPi and recorded CANBus data with the Wakespeed operating and got to decoding. Our code to log Wakespeeed data is [here](https://github.com/natecostello/wakespeed-status).  The script we run for testing, which logs BMS data as well is [here](https://github.com/natecostello/rec-bms-autotesting/blob/master/bms_test/charge_script.py).

## Initial Findings

With data inn hand we could now get a good appreciation of how the system was running.  We noticed that reported Engine RPM looked off, and we felt that the system wasn't charging as hard as expected.  

Based on some [help from the forum](https://www.fordtransitusaforum.com/threads/seeking-idle-rpm-data-and-crankshaft-pulley-effective-diameter.90608/post-1187692) we determined that our pulley ratio parameter was incorrect.  We had assumed (and measured incorrectly) a 6.5" crank pulley diameter which threw off the ratio.  Using the 6" diameter from the forum feed back put our reported engine RPM right in line with expectations.

We increased the "normal derate" parameter by 20% but did not see any change in performance.  We theorized that the system must be operating in "small" mode as we had not changed the "small derate" parameter.  We confirmed this by monitoring serial data from the Wakespeed and looking at field drive.  Upon "opening the patient", we found a DIP switch was placing the system in "small" mode.  We reduced the "normal derate" parameter back to the default ~62%, set the DIP switch for "normal" and retested.

For the following tests, the vehicle was being driven normally, usually a bit of start and stop to get to the highway, followed by cruising speeds between 55-70 mph.  

The tests started with a SOC around 80% and terminated after charging terminated with SOC at %100.  

The measured current is that measured by the BMS into the battery.  For the tests, solar power and all switchable DC loads were secured leaving ~0.7 amps (~20 watts) of base draw for the Wakespeed, Victron Cerbo, loggingPi, router, main contactor, BMS, etc.  We also found that the field drive appears to be about 3 amps or so once the Wakespeed becomes active.  So the data shown below is likely low by about 2-3 amps.

Ambient temperatures were about 85-90 F.

### 46% Field Drive Test

Testing with in "small" with "small derate" parameter (field drive) set to 0.46 (and active) demonstrated the following performance:
![46 field drive](https://docs.google.com/spreadsheets/d/e/2PACX-1vQTcFFKGOb9fqqtI-93NP_QmIu0zNMuipFprKYlAMI2t5KybDCVkyU3Iaa3p2g6vZ4KvjHCGU8NQ7UW/pubchart?oid=766441317&format=image)

The modified configuration file is [here](ALTREG-2022-6-20-v-1.1.txt) with annotations [here](ALTREG-2022-6-20-v-1.1-annotated.txt). Raw test data is [here](2022-6-21-wakespeed-min-dc-load-v1.1-charge.csv).

### 62.5% Field Drive Test

Testing with the "normal derate" parameter (field drive) set to 0.625 demonstrated the following performance:
![62.5 field drive](https://docs.google.com/spreadsheets/d/e/2PACX-1vQTcFFKGOb9fqqtI-93NP_QmIu0zNMuipFprKYlAMI2t5KybDCVkyU3Iaa3p2g6vZ4KvjHCGU8NQ7UW/pubchart?oid=909248006&format=image)

The modified configuration file is [here](ALTREG-2022-6-21-v-1.2.txt) with annotations [here](ALTREG-2022-6-21-v-1.2-annotated.txt).  Raw test data is [here](2022-6-22-wakespeed-min-dc-load-v1.2-charge.csv).

### 84.0% Field Drive Test

Testing with the "normal derate" parameter (field drive) set to 0.84 demonstrated the following performance:

![84 field drive](https://docs.google.com/spreadsheets/d/e/2PACX-1vQTcFFKGOb9fqqtI-93NP_QmIu0zNMuipFprKYlAMI2t5KybDCVkyU3Iaa3p2g6vZ4KvjHCGU8NQ7UW/pubchart?oid=972344222&format=image)

The modified configuration file is [here](ALTREG-2022-6-22-v-1.3.txt) with annotations [here](ALTREG-2022-6-22-v-1.3-annotated.txt).  Raw test data is [here](2022-6-23-wakespeed-min-dc-load-v1.3-charge.csv).

## Future Testing

Idle thermal performance is still undetermined and will be tested in the future.  We also need to decode field drive over CANBus so we can monitor that parameter without relying on serial data.

## Timeline

Note: This doesn't reflect full time effort.  Its sporadic and limited by kiting, other projects, family visits, and van availability.

* Finalized Wakespeed settings, Updated Wakespeed firmware, Uploaded Wakespeed settings, Initial operation (6-16-2022)
* Completed Logging Code (6-17-2022)
* Identified Engine RPM discrepancy (6-20-2022)
* Tested v1.1 46% field drive (6-21-2022)
* Identified "small" mode, configured for "normal" mode", Tested v1.2 62.5% field drive (6-22-2022)
* Tested v1.3 84% field drive (6-23-2022)
