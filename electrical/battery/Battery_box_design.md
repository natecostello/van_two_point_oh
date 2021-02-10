---
section: "van"
category: "electrical"
title: "Battery Design"
author: "Stello"
date: "2020-1-30"
tags: ["battery", "design", "concept"]
---

The battery will be constructed of 280AH cells.  It will be installed behind the driver side rear wheel.

## Cell Insulation

According to the Will Prowes' forum, the aluminum cased cells have positive terminal voltage on the outer case.  This means each group of cells will need to be isolated from each other and from any structure.  This will be accomplished by Kapton tape.

## Cell Compression

EVE engineers recommend approximately 12 PSI, with no more than 17 PSI, to be maintained on the cells.  Allegedly this increases rated cycles from 2500 to 3500.  They also identify approximately 1 mm expansion between 0 and 100% SOC.  This will be accomplished by threaded rod preloaded with belleville washers arranged to give adequate pressure over the expected displacement.  Aluminum sheet will be used for the compression plates.  [This forum post has lots of good information](https://diysolarforum.com/threads/source-of-belleville-washers-for-300kgf-fixture.16733/).  Plan for about [$100](https://www.mcmaster.com/belleville-disc-springs/for-shaft-diameter~1-2/) in belleville washers.

### Empirical Data

In [this post](https://diysolarforum.com/threads/cinergis-28-kwh-4-kw-solar-10-kw-inverter-rv-build.13786/post-198767), user @cinergi measured growth on 4 cells arranged in a similar fashion as they charged from 0 to 100%.  His springs were compressed to 30mm.  At 100% SOC he measured 1.0, 1.4, 1.4, and 2.0 mm growth over the four cells.  Between terminals he measured 0.15, 0.14, and 0.19 mm growth.

His [spring](https://www.leespring.com/compression-springs-hefty?search=LHL625D03) rate specification is 380 lbf/in per spring with a free length of 1.5 in.  Compression to 30mm would correspond to spring compression of 0.32 in (1.5 - 1.18).  That level of compression would correspond to 486.40 lbf (380x0.32x4) and 8.799 PSI initially.  The final level of compression would be 571 lbf  (380*((1.5-1.142) + (1.5-1.126) + (1.5-1.126) + (1.5-1.102))) and 10.339 PSI.

### Design for Service

**100% SOC Condition Compression**

Cell dimensions are 6.85 x 8.07 in.  Cell area is 55.279 in2.  With four cells in the arrangement, the total area under compression is 221.12 in2.  Assuming 12 PSI, this yields a total force of 2653.4 lbf.

* Assuming 15 points of compression, this yields a force per compression point of 176.89 lbf.

* Assuming 10 points of compression, this yields a force per compression point of 265.34 lbf.

**To achieve this compressive force the spring must have a *load at solid height* of at least the above value for each case.  If this parameter matches closely, setup will be easier by simply tightening to the solid condition at 100% SOC.**

**0% SOC Condition Compression**

Cell dimensions are 6.85 x 8.07 in.  Cell area is 55.279 in2.  With four cells in the arrangement, the total area under compression is 221.12 in2.  Assuming 9 PSI, this yields a total force of 1990.0 lbf.

* Assuming 15 points of compression, this yields a force per compression point of 132.67 lbf.

* Assuming 10 points of compression, this yields a force per compression point of 199.00 lbf.

**Growth Allowance**

Assuming growth is 0.079 in (2 mm) from 0 to 100% SOC, the spring rate to achive the desired compression at each SOC is:

* Assuming 15 points of compression, spring rate is 559.75 lbf/in ((176.89 - 132.67)/0.079).

* Assuming 10 points of compression, spring rate is 839.75 lbf/in ((265.34 - 199.00)/0.079).

**To achieve this range of compression the spring must have a *spring rate* of no more than the above value for each case and allow at least 0.079 in of compressive travel.**

**Candidate Springs (must be 1 in or less in free length)**

* For 15 points of compression, the following spring meets the above requirements:
  * LHL 625D 01 at $3.66 per spring [from here](https://www.leespring.com/compression-springs).  This could use up to 5/16 all thread.  It would provide 12.394 PSI compressed solid at 100% SOC and 9.018 PSI at 0% SOC.

* For 10 points of compression, the following springs meet the above requirements:

  * LHL 750C 01 at $4.93 per spring [from here](https://www.leespring.com/compression-springs).  This could use up to 3/8 all thread.  It would provide 10.786 PSI compressed solid at 100% SOC and 7.9458 PSI at 0% SOC.

  * LHL 1000B 01at $5.97 per spring [from here](https://www.leespring.com/compression-springs).  This could use up to 1/2 all thread.  It would provide 10.375 PSI compressed solid at 100% SOC and 8.1595 PSI at 0% SOC.
  * LHL 1000C 01at $6.40 per spring [from here](https://www.leespring.com/compression-springs).  This could use up to 1/2 all thread.  It would provide 14.924 PSI compressed solid at 100% SOC and 10.994 PSI at 0% SOC.
  * LHL 750D 01at $5.53 per spring [from here](https://www.leespring.com/compression-springs).  This could use up to 3/8 all thread.  It would provide 13.002 PSI compressed solid at 100% SOC and 8.8709 PSI at 0% SOC.

### Design for Cell Testing and Top Balance

**100% SOC Condition Compression**

Cell dimensions are 6.85 x 8.07 in.  Cell area is 55.279 in2.  Assuming 12 PSI, this yields a total force of 663.35 lbf.  Assuming 4 points of compression, this yields a force per compression point of 165.84 lbf.

**To achieve this compressive force the spring must have a *load at solid height* of at least the above value for each case.  If this parameter matches closely, setup will be easier by simply tightening to the solid condition at 100% SOC.**

**0% SOC Condition Compression**

Cell dimensions are 6.85 x 8.07 in.  Cell area is 55.279 in2.  Assuming 9 PSI, this yields a total force of 497.0 lbf.  Assuming 4 points of compression, this yields a force per compression point of 124.38 lbf.

**Growth Allowance**

Assuming growth is 0.079 in (2 mm) from 0 to 100% SOC for four cells, total growth of a 16 cell stack would be 0.3160 in (8 mm).  The spring rate for four points of compression, to achive the desired compression at each SOC, is 131.20 lbf/in ((165.84 - 124.38)/0.3160).

**To achieve this range of compression the spring must have a *spring rate* of at nor more than above value for each case and allow at least 0.3160 in of compressive travel.**

**Candidate Springs**

For four points of compression, the following springs meet the above requirements:

* LHL 750B 08 at $6.29 per spring [from here](https://www.leespring.com/compression-springs) has a load at solid height of 183 lbf, 1.43 in of travel, and a spring rate of 128 lbf/in.  This could use up to 3/8 all thread.  It would provide 13.242 PSI compressed solid at 100% SOC and 12.894 PSI at 0% SOC.

## Cell Interconnection

For the EVE 280AH from Amy, the studs are [M6](https://diysolarforum.com/threads/introducing-the-new-improved-shenzhen-luyuan-technology-co.15880/post-195184) with [15mm](https://diysolarforum.com/threads/introducing-the-new-improved-shenzhen-luyuan-technology-co.15880/post-203138) usable length. 

[This product](https://www.erico.com/part.asp?part=MBJ16-100-6) is sized for an M6 stud, is 3.94 in center-to-center, has 31.57 kcmil cross section (5-6 AWG equivalent), and has an ampacity of 120A.  This ampacity rating is consistent with a [6AWG](http://assets.bluesea.com/files/resources/reference/21731.pdf) wire if the cross section is accurate.  Two trippled up connections stack to 0.354 in or 9 mm.  With a M6 nylock nut height of [6mm](http://www.fasnetdirect.com/refguide/Metnutd985.pdf) it should (barely) fit the stud.  It should work (tripled up) for the parallel cell interconnects (ampacity ~270A).

[This product](https://www.erico.com/part.asp?part=MBJ16-150-6) is sized for an M6 stud, is 5.9 in center-to-center, has 31.57 kcmil cross section (5-6 AWG equivalent), and has an ampacity of 120A.  This ampacity rating is consistent with a [6AWG](http://assets.bluesea.com/files/resources/reference/21731.pdf) wire if the cross section is accurate.  It should work (trippled up) for the series cell interconnects (ampacity ~270A).

23*3 = 69 interconnects.  This would cost like $600

[This product](https://www.erico.com/part.asp?part=MBJ50-100-10) is sized for an M10 stud (hole diameter is 0.413 inches), is 3.94 in center-to-center, has 98.7 kcmil cross section (1-1/0 AWG equivalent), and has an ampacity of 250A.  This ampacity rating is consistent with a [1 AWG](http://assets.bluesea.com/files/resources/reference/21731.pdf) wire if the cross section is accurate.  Two connections stack to 0.196 in or 5 mm.  With a M6 nylock nut height of [6mm](http://www.fasnetdirect.com/refguide/Metnutd985.pdf) it should (comfortably) fit the stud.  With this size hole, good contact with the terminal can't be ensured.



[These busbars](https://www.aliexpress.com/item/1005001940967607.html?spm=a2g0o.productlist.0.0.18e64b71vAtzyG&algo_pvid=9b8bd3b4-3b93-4a0c-ba41-009269daf1a8&algo_expid=9b8bd3b4-3b93-4a0c-ba41-009269daf1a8-0&btsid=0b0a556e16128926681981046e2c00&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_) should work.  They appear to be about 2mm thick, composed of laminated copper sheets.  By separating and re-combining, they could achieve the ampacity desired.  Because of the curve, the should accomodate the small amount of movement needed for parallel cell interconnects.  For series connections, a solid bar is probably fine because growth in that dimension should be negligable.  24-32 should be enough.  This would cost about $200.  It might be worth nickle plating.   @cinergi from the diysolarpower forum pointed me to [this supplier](https://amprevolt.com/collections/battery-accessories/products/prismatic-cell-lifepo4-busbar?variant=32166752223284) of the same bus bars for $2.50 each.  This would bring the cost to under $100.

