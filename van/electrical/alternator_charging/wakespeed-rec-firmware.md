
```
#
# Configuration file for REC BMS
#
#     SMA w/Zero Output Technology
#	Note:  If instability is seen with Current Regulation, connect
#	       WS500 Current Shunt Sensors to battery current shunt.
#     CAN 250Kbps
#     Battery system: 
#	Primarily Managed by REC BMS
#	Fallback (Limp home mode) = fixed 13.2v
#	Hard temperature safety limits 0..50c
#	Reduced Charge Rate (0.02c) outside: 5..45c
#     Alternator:  100c target, standard pullbacks.  30 second warmup   
#
#	Must use 'Victron' version of REC BMS
#

       
# REC BMS 4-11-2020
$SCA: 0,100,1.00,0.75,0.50,0,0,0,10000,0,0,30,0@
```
Changes ALTERNATOR (and System) parameters.  
The first parameter, 0, specifies use of the battery temperature sensor for battery temperature vice alternator temperature.
>**BTS2ATS?:** <WHOLE NUMBER (0, or 1)> If BTS2ATS? is set = 1, the Battery Temperature Sensor will be treated as a 2nd Alternator Temperature Sender. The warmer of the two sensors will be used as Alternator Temperature for both reporting and regulation. Useful if two alternators are being driven from one regulator using a common field. Make sure the Battery temperature is being supplied via the CAN. Using the BTS for a 2nd ATS is also useful with the DC-DC converter option; it allows two alternators to be monitored.
>
>(Default = 0)

The second parameter, 100, specifies target upper alternator temperature in C.
>**Alt Target Temp:** <WHOLE NUMBER (15 -> 150)> Operating temperature the regulator should attempt to keep the Alternator under in degrees C. If the Alternator temperature exceeds this value, the regulator will reduce field current to allow the alternator to return to a safe operating temperature. If the Alternator temperature continues to rise and exceeds this temperature by 10% the regulator will fault out and stop producing power. Alt Target is used by the DC-DC converter to reduce power transfer as alternators reach their target temperature.

The third (1.00), fourth (0.75), and fifth (0.50) parameters specify alternator derates.
>**Alt Derate(norm),**
>**Alt Derate(small),**
>**Alt Derate(half):** <FLOATING POINT NUMBER (0.0 -> 1.00) > These derating values are used to limit the alternator’s maximum current output to some % (10% to 100%) of its demonstrated capability (see Alt AmpCap). The three values correspond to the mode the Alternator:
>* Normal - Condition when either of the other modes are not selected.
>* Small Alternator Mode – selected via DIP switch 8.
>* Half Power Mode – Selected by shorting the Alternator NTC temperature sensor wires.Half-power mode may also be selected when engine RPMs fall below the threshold set via <Trigger Half-power RPMS> in the $SCT: commend below, or via the Feature-In (See $SCO: command below).

The sixth parameter, 0 specifies the pull-back factor for reducing Field Drive at lower RPMs, in this case disabling it.

>**PBF:** < INTEGER (-1 -> 10)> Pull-back factor for reducing Field Drive at lower RPMs. If the WS500 Alternator Regulator is able to determine RPMs (via the Stator wire), the Alternator Field Drive will be reduced when the regulator detects the engine is at Idle. At idle the max PWM will be capped at around 1/4 of full field, which should result in some current bring produced. As RPMs are increased, this ‘Field Drive Capping’ will slowly be removed. PBF determines how quickly this pull-back is scaled off.
>Set = 0 (DEFAULT) to disable this feature.
>Set = -1 to cause Field Drive to be reduced to a maximum of 70% drive in the case where the WS500 Alternator Regulator is no longer able to measure RPMs via the Stator-in signal. This might be for example where an engine is operating at extremely low RPMs, below the cut-in point for the alternator. Or where the engine is no longer running. The 70% limit will only be enabled if at one time during operation the regulator was able to measure RPMs successfully.
>
>If PBF is used, for many engine / alternator combinations a value of 1 will result in good operations. However, if you have installed a large alternator on a rather modest sized engine, you might notice the engine struggles when trying to increase RPMs from idle. In that case, increase the PBF value. A factor of 8x or so might be needed in the case of a small sail-boat engine with a large 150A or greater alternator (consider also using the Alt Amp Cap and/or System Watts Cap capabilities as well to restrict maximum engine loading at higher RPMs).
>
>If the engine has a large capacity relative to the alternator size, consider reducing the PBF to 1. Doing so will allow a greater production of amps while at idle, while at the same time preventing the alternator from being driven at Full Field during low RPMs (and hence low cooling)
>
>Finally, if your system matches an engine with great capability, and the alternator has good cooling / heat management – you can set the PBF factor = 0 to disable any capping of field drive while the engine is at idle. This will allow for maximum alternator output at idle, however if the regulator is enabled but the engine is not actually running, field drive will increase to Full Field until a fault check causes the regulator to reset. Do not leave the ‘ignition’ in the ON position, without the engine actually running to prevent this situation. It would be advisable to assure there is a temperature sensor attached to the alternator in this case – to prevent unintended overheating during prolonged idle periods.
>
>Note: Field pull back is dependent upon the stator sensing wire being connected to the alternator. If the regulator is unable to reliably sense RPMs, all idle pull-back features will be disabled. Note also that one should make sure to configure the tachometer via the $SCT: command.

The seventh parameter, 0, disables Alternator Amperage Capacity.

>**Alt Amp Cap:** <WHOLE NUMBER ( -1 -> 500 ) > Alternator Amperage Capacity (<Alt Amp Cap>) is an uncommon factor and primarily used when the Current Shunt located at the alternator (vs. the battery). When defined the regulator will limit the Amperage output of the alternator to this value, after applying the ‘Alt Derate xxx’ factors. (Reference Derate factors above) There is no adjustment made to this value based on system voltage or selection of system battery size – the values declared will be used directly. A special feature is enabled by setting this = -1: the regulator will drive the alternator as hard as it can for a short period of time when 1st entering Bulk phase and in this way will auto-sample the alternator size based on its capabilities.
>
>(Default = 0, disabled)
>
>Do note with this option, there may be some interactions between the field % pullbacks and an attempt to reduce what is perceived as ‘alternator current’ pullback, for example during half-power mode. With Alternator Amperage Cap disabled, reduced power modes will apply the scaling factor to the PWM duty cycle. It should be noted that there may not be a direct relation between reductions in PWM duty cycles and delivered Amperages – care should be used when setting up the system. 

The eighth parameter, 0, disables a system watts cap.  This is primarily used to protect the engine and/or belts by limiting power (hence watts versus amps).

The ninth parameter, 10000, is the amps shunt ratio in terms of Amps/Volts.  A 500A/50mVolt shunt corresponds to 10000.

The tenth parameter, 0, tells the system not to flip the polarity of the shunt measurement (1 would flip it).

The eleventh parameter, 0, tells the system to enable 'auto' determination of Idle RPM.

The twelfth parameter, 30, specifies the delay in seconds from when first powered on before applying load to the engine.

The thirteenth parameter 0, disables critical required sensor checks.

```
$CPA:8 13.2,0,0,0@
```
The first parameter, 13.2, is "acceptance" voltage, aka absorption voltage, normalized to a 12 volt system.

The second parameter, 0, sets, or in this case disables, a timer in minutes to remain in acceptance aka absorption.

The third parameter, 0, sets, or in this case, disables, amp-based exit criteria for acceptance aka absorption.

Setting these both to 0 bypasses ACCEPT aka absorption.

The forth parameter is reserved and should be zero.
```
$CPO:8 0,0,0.0,0@
```

Overcharge (finish) phase parameters, zeros disable this phase/mode.

```
$CPF:8 13.2,0,0,0,0.0,0.0,0@
```

Float phase parameters.  The first parameter sets voltage (normalized to 12V systems).  Setting this parameter to 0.0v will cause all charging to stop during 'float' mode.

While we don't plan to float, per se, the Revert SOC parameter looks useful.  This sets a SOC, from the BMS, for which the wakespeed will reenter BULK.



```
$CPP:8 0,0.0,0,0.0@
$CPE:8 0.0,0,0,0@
$CPB:8 0.0,0,2,50,0.0,5,40,25,0@
$SCO:8,0.0,0.0,0@
$SCN: 0,WS500-REC,1234@
$CCN:0,1,70,1,1,1,1,3,0,0,0.0,0@
$SCT: 12,2.83,0,0,0@
```