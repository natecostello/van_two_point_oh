---
section: "van"
category: "electrical"
title: "Battery Box"
author: "Stello"
date: "2020-11-03"
tags: ["battery", "design", "concept"]
---

With 3 inches of XPS on the sides of the battery, the total thermal resistance is 4.48 C/W.  This only accounts for the sides and bottom of the container.  A minimal 10 Watts would drive a delta-T of 44.8 C over outside ambient temperatures.  Easy to heat, but will get too hot during charge and heavy load.  For perspective.  Assuming 0.3 mOhm internal cell resistances, a 16 cell 24V battery will disipate 21W during a 200A charge.  This means the battery should exchange heat with the van internals via the top.  We might need a hot weather "mode" that allows heat exchange with the outside.

However, we must account for the specific heat capacity of the bank itself.  [This paper](https://core.ac.uk/download/pdf/144147357.pdf) provides lumped parameter assumptions for LFP.  Using the more conservative value for specific heat capacity (825 J/kg*C), with a pack mass of 87kg (16 280HA cells), a two hour 200A charge produces a bulk temperature increase of 21W * 7200s / (87kg * 825 J/kg*C) = **2.1C**, assuming adiabatic conditions.  Given this view, overheating shouldn't be a problem even in summer as long is there is some communicaiton with the van interior.  Additionally, even a small continuous 1-5 W heat source would keep things well above freezing assuming sub-zero outside temps.