2022-2-9
finished fabricating threaded rod/bolts

2022-2-18
main contactor bust and pivot

2022-2-21
Ordered egis battery switch

2022-2-21
Reconfigured battery cells to planned arrangement
Started fabbing 8AWG jumpers

2-23-22
Fabbed BMS sense lines

2-24-22
Completed BMS sense lines

3-1-22
Completed battery output buswork design and ordered

3-5-22
Assembled battery, connected BMS and monitoring.

3-6-22
Started balance pre-charge.
Fabricated long tie rods for balance.
Cut end panels for balance.

3-7-22
Finished pre charge

3-8-22
Reconfigured for parallel top balance.
Started balance w/ linear supply

3-9-22
Shifted to riden, but kept peak level (with noise) below 3.65.  When peak noise hit 3.64, stopped (none of this captured).
Resumed and completed with linear supply.  Used DMM as basis for completion (let it hit 3.651).  Amps were about 1-2 at this point.
Reconfigured to cells.
Cut and installed IR LEDs for heating in the base.

3-12-22
Notched battery end panel for IR LED wires to pass through - need to notch a little wider

3-16-22
Cut battery floor insulation
Fit up bus bar and made some hole modifications
Installed battery switch
Installed main contactor
Installed main shunt
Electroplated negative bars

3-17-22
Electroplated remaning bus bars
Cut wood guards for battery and added channels for wiring
Installed lower positive bus bars
Installed precharge on battery output panel

Note: Should move this into battery install post
3-18-22
Loaded cells into van
tensioned cells
Installed BMS temp sensors
Began shimming non output panel

3-19-22
Installed and tested heating pads and IR LEDs.
Moved battery into place.
Landed battery output cable to battery output buswork and main positive bus
Installed neg/ground bus
Installed alt shunt
Installed control power fuse block
Installed control ground bus

3-20-22
Fully bolted in multiplus using these for the bottom two fastening locations: https://www.mcmaster.com/91306A673/
Installed multiplus chassi grouond
Landed multiplus, solar, branch, alt cables and grounds.
Grounded multiplus chassis
Grounded chassis ground bus to main neg bus
Installed Solar Charge enable line
Installed battery protect
Soph fabricated battery hold down brackets (aft end is like 1/8 "lower" than fwd end...who knows).



3-21-22
Installed BMS physically
Installed BMS wifi
Temp mounted Cerbo
Installed Cerbo to Battery Protect connection
Continued control wiring
Populated control panel
Installed control panel brackets and velco
Installed aft battery panel brackets and modified panel for battery hold down brackets
Cut back battery hold down brackets and installed and torqued
Installed forward upper cross beam
Installed forward battery panel and modified panel for battery hold down brackets
Tested 1" XPS battery insulation - too thick, will use thinsulate
Wired control panel switches
Installed Multi Charge enable line
Installed Multi Temp sense line

3-22-22
Din mounted CERBO
Completed BMS to Panel switch wiring
Completed Multiplus AC install
Completed AC Panel Wiring
Configured Battery Protect for 24V
Installed wakespeed physically
Installed BMS to CERBO CAN lin

Reminder - SWAP VBATT Pre and Post contactor fuses for 2A to meet blue sea panel lighting documenation

3-24-22
Inital power on

3-25-22

I notice about 3.4V on the positive bus wrt batt neg when thee main switch is closed.  After opening, the inverter input caps seem to hold this voltage.  Troubleshooting source:

1. I pulled all pre contactor fuses.
2. Let voltage disipate down to < 1V
3. Close switch. - no change in voltage
4. Insert bms wifi fuse - no change in voltage
5. Insert multiplus v sense fuse - observed spark and 3.4V on positve bus (so one one source)

6. Removed v sense fuse and let voltage drift back down to < 1v
7. Insert precharge batt+ fuse - no change
8. Insert "to switch pre cntr" fuse - no change

Will leave voltage sense disconnected for now

Turn on transients captured in SDS0001.*


Updated multplus using victron connect and mk3 interface.  Initial attempt failed immediatly and warned it can not be updated with DMC connected.  Disconnected DMC and was successful.

Changed settings, see file.

Short test with heater running.  No issues.

3-27-22
Set up communication between BMS and Cerbo - had to use forum tips.
Wasn't happy with the contactor close transient even with precharge.  Modified circuit and modified timing to make more optimal.  See traces.
Tested temperature sensors:
Cell 3 = top center
Cell 1 = pass aft
By elimination, Cell 2 = pass fwd

3-28-22
Let system top battery.  When full, current limit read from cerbo was like ~9 and multi was in "absorption".  
REC manual says it allows making up for DC loads.  Not our desired behavior.  
If I set "end of charge voltage hysterisis per cell" to a high value like 1.5, it should limit charge voltage after charge completion to 3.28 per cell.  Also noted that SOC hysterisis doesn't appear settable from wifi module.

3-29-22
Set END of charging voltage hysteresis per cell [V] (CHIS): to 1.5 (from 0.25) which yeilds a VCL of 26.24v or 3.28v per cell

This prevented charging to "make up for DC loads".  However, I was concerned that using voltage would not be as accurate as SOC given theh flat discharge curve.

3-30-22
Primoz responed via email how to set the SOC parameter via wifi.

Default SOC Hysteresis was 0.05.
I set SOC Hysterisis (SOCH) to 0.15
I set END of charging voltage hysteresis per cell (CHIS) to 1.15 which yields a VCL of 26.8v or 3.35v per cell.  This should let the system cycle down to 85% SOC before resuming charging.

After setting these, it looks like CCL is still 9.7A while VCL reflects 26.8.  The victron system is providing some power to the battery so its not clear that SOCH accomplishes what I intended, but its hard to tell for sure because PV is likely limited by an overcast sky so I can't see what it would do if able.
4-2-22
It appears that CCL never exceeds 9.7A even when SOC is down to 60% and voltage is down to 26.37V

4-3-22
Set CHIS back to 0.25.  Will see if charges.
Checked CERBO - CCL is now back to 279A.

8-24-2022
Removed insulation from ends and top of battery to lower temperatures.