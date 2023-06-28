---
type: post
section: blog
categories: 
 # one or more categories is permitted
 - electrical
navTitle: 
title: Battery Management System Failure?
author: Nate
date: 2023-06-26
tags:
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
tldr: "While driving the Going-to-the-Sun road in Glacier National Park, we had a complete electrical system failure."
---

**TLDR: While driving the Going-to-the-Sun road in Glacier National Park, we had a complete electrical system failure.**

## Background

Documentation of our BMS and system control logic is [here](/van/electrical/BMS_wiring_logic/REC_Q_BMS_Wiring_Logic).

General electrical system design and schematic is [here](/van/electrical/electrical_overview/electrical).

Relevant Battery Management System (BMS) parameters are as follows:

| Setting | Value |
|BMIN| 3.4 |
|BVOL| 3.45|
|CMAX| 3.7|
|MAXH| 0.25|
|CHAR| 3.45|
|CHIS| 0.12|

These parameters had been in use since March 5th, 2023.

## Recent History

In the preceding days we had been crossing the country on our way west. To keep our electrical system topped for the trip, we had set our state-of-charge (SOC) hysteresis resume charge at 95%. This means the system would stop charging at 100% and then discharge down to 95% before resuming any charge. We don't float our battery at all. This setting has been in use since June 13th, 2023.

We started the day with an 85% charge. Because we were driving several hours that day to reach Glacier, we would hit 100% charge well before arriving after which our SOC would drift down potentially starting another charge cycle. Later review of data showed this to be the case.

Upon arrival at Glacier, we opted to drive the Going-to-the-Sun road. This means a long climb in lower gears with higher than cruising RPM.

## Initial Indications

During a short stop traveling up the road, we noticed beeping from the Victron Cerbo. We then noticed loss of house lights, fans, and loss of our Van Area Network, or VAN for short.

## Troubleshooting

Upon return to our campsite, we began trouble shooting. We found the BMS had no LED's lit. Main contactor was open as expected. Cycling the on-off switch on the BMS had no effect. Battery voltage at the BMS was normal, cell voltages at the BMS were normal. Ground continuity to the BMS was normal. All BMS connections were solid. No abnormal indications were obvious other than the lack of indicating LEDs on the BMS.

With no error codes available from the BMS available, and all battery voltages normal, we bypassed the BMS to provide power for the evening. With out internet connectivity at our campsite we were not able to pull any VRM logs.

Later that evening we observed that 3 of 4 usb outlets installed in our van had failed.

## Data Review

The following day we drove to an area with a clear view of the sky, connected to the internet and downloaded the Victron Cerbo data from previous day.

The raw CSV is available [here](Rusalka_20230626-1600_to_20230626-2059.csv)

A close look at the data showed two anomalies, at 18:34 and 19:14, that preceded the final system failure, at 22:23. Note, these times (and all timestamps in the data) are Eastern Daylight Time whereas the local time zone was Mountain Daylight Time.

### Anomaly 1

The initial conditions include a battery lightly discharging (≈3A), normal battery voltage (26.58V), SOC of 95%, and a BMS commanded Charge Current Limit (CCL) of 0A.

At 18:34:14 there are indications of the BMS controlled main contactor opening. The main contactor status is indicated by low battery voltage being measured by the Solar MPPT, the Victron Multiplus, and the Wakespeed alternator controller. System DC voltage is held up above zero during this period by the Solar MPPT. During the same period, BMS battery voltage and max and min cell voltage is reported as unchanged at normal values, while BMS battery current is reported as zero. Also during this period, the Wakespeed reports 'BMS Lost'.

About 6 seconds after the main contactor opens, the BMS commanded (CCL) begins to rise with the first non-zero value of 41.9A.

About 30 seconds after the main contactor opens, it appears to close based on non-zero BMS reported battery current and the return Solar MPPT, Multiplus, and Wakespeed measured voltage to the BMS reported value.

Charging from Solar and the Alternator proceed normally after this point until 18:42 at which point charging is secured normally. Reported min and max cell voltages are 3.43 and 3.45 respectively.

![anomaly 1](https://docs.google.com/spreadsheets/d/e/2PACX-1vSbE8er3ijHyQXG_GIT9Z76bVsXoG58xG48BhMC4GSKLDf8ZlqKubbqRVlhcdLG17Iw3TwE8wU0vDPe/pubchart?oid=451174859&format=image)
**Anomaly 1**

### Anomaly 2

The initial conditions include a battery lightly discharging (≈4A), normal battery voltage (26.63V), SOC of 100%, and a BMS commanded CCL of 0A.

At 19:15:05 there are indications of the BMS controlled contactor opening (similar indications as anomaly 1). At the same time, there appears to be a 10 second loss of BMS communication evidenced by no BMS sourced data over this period. Around this period, the Wakespeed reports 'BMS Lost'.

About 10 seconds after the contactor opening BMS communication returns, however, the BMS reported SOC is 50%. This is indicative of BMS reset with its default starting SOC. At the same packet the BMS commands a CCL of 41.0A.

About 15 seconds after the contactor opening, it appears to close based on non-zero BMS reported battery current and the return Solar MPPT, Multiplus, and Wakespeed measured voltage to the BMS reported value.

Charging from Solar and the Alternator ramps in the minute that follows peaking at a logged value of ≈80A.

At 19:16:54 there is indication of the main contactor opening indicated by a high voltage being measured by the Solar MPPT (32.99V), the Victron Multiplus (33.17V), and the Wakespeed alternator controller (29.19V). At this same point in time the BMS suspends communication for ≈5 seconds. The wakespeed locks-in a 'Fault' condition. The Multiplus (VE.Bus) warns of high DC ripple. Reported min and max cell voltages immediately before and after are 3.36V.

About 30 seconds after the contactor opening the second time, it appears to close based on non-zero BMS reported battery current and the return Solar MPPT, Multiplus, and Wakespeed measured voltage to the BMS reported value.

![Anomaly 2](https://docs.google.com/spreadsheets/d/e/2PACX-1vSbE8er3ijHyQXG_GIT9Z76bVsXoG58xG48BhMC4GSKLDf8ZlqKubbqRVlhcdLG17Iw3TwE8wU0vDPe/pubchart?oid=163465309&format=image)
**Anomaly 2**

Charging from Solar proceeds normally for for the next ≈45 minutes.

At 19:41:27 the wakespeed stops reporting data. This is coincides with our arrival at Glacier and initial parking.

At 19:57:38 The wakespeed resumes reporting data and indicates an 'Off' state. It likely reset following an engine off-on cycle.

At 19:58:51 the Wakespeed reports a prompt shift to 'Float' a field drive of 83% and a current of 200.5A for 2 seconds. Simultaneously the BMS resets its SOC from 50% to 100% and reduces the commanded CCL from 279.9A to 0A. BMS reported current is 200.6A, Min and max cells are reported to be 3.43V and 3.45V respectively (up from 3.36 before the Wakespeed transient).

After this period, the system discharges normally for the next several hours.

### Anomaly 3

The initial conditions include a battery lightly discharging (≈6A), normal battery voltage (26.57V), SOC of 97%, and a BMS commanded CCL of 0A.

At 22:25:33 there are indications of the BMS controlled contactor opening (similar indications as anomaly 1). At the same time, there appears to be a 6 second loss of BMS communication evidenced by no BMS sourced data over this period. Around this period, the Wakespeed reports 'BMS Lost'.

At 22:25:39 the BMS reports a SOC of 96% and raises the CCL to 41.9A. Indications of an open main contactor persist.

Over the next ≈40 seconds, BMS comms repeatedly drop for ≈5-10 seconds at a time.

At 22:26:15 the BMS reports a SOC of 50%.

BMS comms drop for ≈27 seconds

At 22:26:43 the BMS reports data for the last time.

![Anomaly 3](https://docs.google.com/spreadsheets/d/e/2PACX-1vSbE8er3ijHyQXG_GIT9Z76bVsXoG58xG48BhMC4GSKLDf8ZlqKubbqRVlhcdLG17Iw3TwE8wU0vDPe/pubchart?oid=1953508423&format=image)

## Conclusion

Clearly the BMS is dead. The hard resets in SOC and communication drops coinciding with the contactor opening are suggestive that the BMS failure is the root cause and isn't failing as a result of some other issue. This opinion was shared by Rick, the North American BMS rep.

One significant concern is the way in which it failed. The second cutoff during the second anomaly occured under fairly significant charging. This is potentially damaging to the the alternator diodes and is a primary reason to have a BMS that coordinates cutoffs with the other charging components. The resulting voltage transient as the Multiplus input capacitors were charged led to an excursion over 30V. Thankfully only the USB plugs were damaged in this case and not the fridge, freezer, fans, inverter, etc. We won't know that the alternator is intact until after the BMS is replaced.

Ideally, REC, the OEM for the BMS can provide additional information regarding this failure after they review the data and potentially inspect the unit.
