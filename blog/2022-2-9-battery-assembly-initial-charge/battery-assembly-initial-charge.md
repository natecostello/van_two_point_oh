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

