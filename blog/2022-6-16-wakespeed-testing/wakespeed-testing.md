2022-6-16
Initial wakespeed testing

See files

2022-6-20
Identified Engine RPM discrepancy.  Based some [forum discussion](https://www.fordtransitusaforum.com/threads/seeking-idle-rpm-data-and-crankshaft-pulley-effective-diameter.90608/) identified that crank pulley should be 6" and thus ratio needed adjustment.

Created v1.1 wakespeed file to correct ratio discrepancy and bump up field current by about 20%.

Installed v1.1 configuration.

2022-6-21
Noticed no significant change in current for similar RPM.  Theorized that alternator is in 'small' mode.  Couldn't determine CAN PGN that has field data, but was able to connect logging PI to the wakespeed usb/serial and pull information:

AST;,0.05, ,27.08,129.4,129.4,3502, ,28.10,149,15000,39, ,29,63, ,1800, ,27.08,42,-99,45

Based on this data, it appears that field is never taken beyond 45% which is consistent with the "small" derate setting (46%) in both v1.0 and v1.1 configuration files.

Will confirm setting tomorrow and install v1.2 settings which maintains the fix to Engine RPM but reverts field current back to v1.0 (default values).

2022-6-22
updated wakespeed config to v1.2
flipped dip switch 8 to off (disable small alt mode)
retest showed increased current.
data shows current still not hitting rated values.  bumping up field excitation again in v 1.3