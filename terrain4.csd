<CsoundSynthesizer>
<CsOptions>
-o dac -+rtmidi=null -+rtaudio=null -d -+msg_color=0 -M0 -m0 -i adc 
</CsOptions>
<CsInstruments>
sr=35000
kr=35000
ksmps=1
nchnls=2

; GLOBAL CHANNELS 
 
gaL init 0 ; GLOBAL WET SIGNAL 
gaR init 0 

seed		0
instr 1 ;3-D wave terrain with oscils/phasors

;Color Values 
kRedValue chnget "Red"
kGreenValue chnget "Green"
kBlueValue chnget "Blue"
kAlphaValue chnget "Alpha"

kPosX chnget "xView"
kPosy chnget "yView"

kVelX chnget "VxView"
kVelY chnget "VyView"

iVelX chnget "VxView"
iVelY chnget "VyView"

iRedValue chnget "Red"
iGreenValue chnget "Green"
iBlueValue chnget "Blue"
ktoggle chnget "FirstSwitch"
ktypee chnget "typeftable"

kVolumeva chnget "VolumeValue"

;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table




kenv linseg 0,.02,p4,p3-.04,p4,.02,0 ;amp envelope

irange = ((iVelY + iVelX)/2)/100

aenv madsr 1, 1, 1, 1

;x index values follow

if (ktypee == 1) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 2) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,1 ;p11=x index function p6
elseif (ktypee == 3) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 4) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 5) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 6) then
else
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
endif

;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
kxndx = frac(kxndx+1000.5+kPosy) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint


;y index values follow


if (ktypee == 1) then
kyndx oscili kGreenValue,((kVelX+kVelY+10/2)+kGreenValue)/kGreenValue,10 ;p11=x index function p7
elseif (ktypee == 2) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,16 ;p11=x index function p6
elseif (ktypee == 3) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,1 ;p11=x index function p6
elseif (ktypee == 4) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 5) then
kxndx oscili kRedValue,((kVelX+kVelY+10/2)+kRedValue)/kRedValue,3 ;p11=x index function p6
elseif (ktypee == 6) then
else
kyndx oscili kGreenValue,((kVelX+kVelY+10/2)+kGreenValue)/kGreenValue,10 ;p11=x index function p7
endif
;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
kyndx = frac(kyndx+1000.5+kPosy) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint


;y index values follow
if (ktypee == 1) then
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,10 ;p11=x index function p7
elseif (ktypee == 2) then
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,16 ;p11=x index function p7
elseif (ktypee == 3) then
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,1 ;p11=x index function p7
elseif (ktypee == 4) then
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,3 ;p11=x index function p7
elseif (ktypee == 5) then
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,3 ;p11=x index function p7
elseif (ktypee == 6) then
else
knndx oscili kBlueValue,((kVelX+kVelY+10/2)+kBlueValue)/kBlueValue,10 ;p11=x index function p7
endif
;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
knndx = frac(knndx+1000.5+kPosy) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint

;moving orbits 1
if (ktypee == 1) then
ax tablei kxndx,3,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,11,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,12,1,0,0

;file terrain.other2
elseif (ktypee == 2) then
ax tablei kxndx,12,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,2,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,16,1,0,0

;moving orbits
elseif (ktypee == 3) then
ax tablei kxndx,1,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,3,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,10,1,0,0

;file terrain.other1 with
elseif (ktypee == 4) then
ax tablei kxndx,3,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,13,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,14,1,0,0

;file terrain.1x3sine with
elseif (ktypee == 5) then
ax tablei kxndx,3,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,1,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,10,1,0,0

elseif (ktypee == 6) then


else
ax tablei kxndx,3,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,11,1,0,0 ;normalized (-1 to +1) audio for y plane
an tablei knndx,12,1,0,0

endif




az = ((ax+ay+an)*(ax-ay-an))*kenv ;tracks z plane to generate terrain waveform
outs ((az*0.2)*kAlphaValue*kVolumeva),((az*0.2)*kAlphaValue)*kVolumeva
gaL = ((((ax+ay+an)*(ax-ay-an))*kenv)*kVolumeva)*0.5
;gaR = ((ax+ay+an)*(ax-ay-an))*kenv


endin





/************************************************/ 
/************************************************/ 
/* */ 
/* EFFECTS INSTRUMENTS */ 
/* */ 
/************************************************/ 
/************************************************/ 

instr 2; Revrb

ktoggle chnget "FirstSwitch"

kPosX chnget "xView"
kPosy chnget "yView"
kreverb chnget "ReverbValue"
kPitchreverb chnget "ReverbPitchValue"

krevdiv = 1

;Start if toggle
if (ktoggle == 1) then


aL, aR	reverbsc	gaL,gaL, kreverb/krevdiv, kPitchreverb,44100,1.0

outs aL, aR

gaL = 0
gaR = 0

;end if toggle
endif

endin


</CsInstruments>
<CsScore>
f 1 0 8192 10 1 ;sine
f 2 0 8192 7 0 2048 1 4096 -1 2048 0 ;triangle
f 3 0 8192 7 -1 8192 1 ;phasor from -1 to +1


f10 0 8192 10 0 0 1 ;3 sines
f11 0 8192 10 1 .43 0 .25 .33 .11 0 .75 ;more complicated terrain
f12 0 8192 9 9.75 1 0 2.25 1 0 ;zeros out due to end of cycle cancellation
f13 0 8192 9 1.66 1 0 3.33 1 0 ;zeros out due to end of cycle cancellation
f14 0 8192 9 1.25 1 0 4.25 1 180 ;zeros out due to table end phase inversion
f15 0 8192 9 1 1 0 1.5 1 0
f16 0 8192 9 3 1 0 3.5 1 0


;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table


;i1 0 3600 32000   1   3  1 1  3 1  ;file terrain.1x3sine phasor
;i1 0 3600 32000  1   3  1 1 2 2  
;i1 0 3600 32000  .1   3  1 1 3 1  ;file terrain.1x3sine with
;i1  0 3600 32000 1   3  1 1  3  10 ;moving orbits   3
;i1 0 3600 32000   .1   3  3  3 1 10 ;file terrain.1x3sine with  6
;i1 0 3600 32000  3  3   10  3 1 10 ;moving orbits2 
;i1 0 3600 32000   .1   3  3   3 13 14 ;file terrain.other1 with 7
i1 0 3600 32000  3   3   10   ;moving orbits 1  1

;i1 0 2 32000   .1   3  1 .1 440 440 3 1 10 ;file terrain.1x3phasing 
;i1 2.5 2 32000   1   3  .1 1 330 333 3 1 10 ;moving orbits
;i1 0 2 32000   .2   1  .4 .2 220 220 1 15 16 ;file terrain.other2 
;i1 2.5 2 32000   .5   3  .2 .5 220 220 1 15 16 ;moving orbits

;i1 0 3600 32000 .2    1   16 12 2 16 ;file terrain.other2 2

;i1 12.5 10 32000   .5   3  .2 .5 220 220 1 1 10 ;moving orbits
i2 0 3600



e
</CsScore>


</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>256</width>
 <height>282</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
