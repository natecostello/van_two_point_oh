---
section: "van"
category: "electrical"
title: "Main Contactor"
author: "Stello"
date: "2020-12-29"
tags: ["24V", "main contactor","design", "concept", "electrical", "van"]
---
# Main Contactor

**TLDR:** Under Consideration

### Latching Contactor

The Latching Contactor (that behaves as a NO Contactor) under consideration is the [Blue SEA ML-RBS 7717](https://www.bluesea.com/products/7717/ML-RBS_Remote_Battery_Switch_with_Manual_Control_Auto-Release_-_24V)

Power usage is 0.013A * 24V = 0.312W

Max Voltage = 32

10,000 at 24V and 150A*

Continuous Rating 2/0 225A

Continuous Rating 4/0 300A

Cost $200 (Amazon)

*This should be good enough.  Manual interrupt will occur at low current as a matter of practice.  Un-planned loaded interrupt will generally be at :

* cell OV conditions under charge, which should be low current as managed by the BMS.

* cell UV conditions under discharge, which should be well under 150A even with a fully loaded multiplus compact (~75A).

Based on some second hand discussion with Blue Sea, this device will also function as a manual battery disconnect.

>**Me:** what I’d like to know is if the manual switch will physically open (ie break welded contacts) or is it just a secondary soft control...any idea?

>**[@Van Gogh](https://www.fordtransitusaforum.com/members/van-gogh.89410/):**Nevermind, I see what you mean. Read your github, so 24V, and you're asking about yellow manual switch behavior during or after a fault scenario that welded its contacts. I'll add it to my next round of questions for Blue Sea.

>**[@Van Gogh](https://www.fordtransitusaforum.com/members/van-gogh.89410/):**They confirmed its a mechanical breaking of the contacts.

### Normally Open (NO) Contactor

The NO contactor under consideration that meets all requirements is the [TYCO EV200AAANA](http://www.rec-bms.com/datasheet/Technical_datasheet_Kilovac.pdf)

Power usage is 0.07A * 24V = 1.68W

Rated Voltage < 36V

10,000 Cycles at 24V and 2000A

100,000 Cycles at 24V and 200A

Continuous Rating 400MCM 500A

Cost $178

Requires separate manual battery disconnect