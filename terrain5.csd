<CsoundSynthesizer>
<CsOptions>
-odac           -iadc     -d 
</CsOptions>
<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=2

; GLOBAL CHANNELS 
 
gaL init 0 ; GLOBAL WET SIGNAL 
gaR init 0

; GLOBAL tables pitch shifter
giWet ftgen 0, 0, 1024, -7, 0, 512, 1, 512, 1 
giDry ftgen 0, 0, 1024, -7, 1, 512, 1, 512, 0 
 

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


;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table


kenv linseg 0,.02,p4,p3-.04,p4,.02,0 ;amp envelope

irange = ((iVelY + iVelX)/2)/100

aenv madsr 1, 1, 1, 1

;Red index values follow
kxtrans line p5,p3,p6 ;transverse movement in x plane done
kxamp line p7,p3,p8 ;index oscillator amplitude
kxamp = kxamp*.5 ;normalizes oscil amp to index table
kxfreq line p9,p3,p10 ;x plane index oscil frequency
kxndx oscili kRedValue,(((kVelX+kVelY+10/2)/5)+kRedValue)/kRedValue,p11 ;p11=x index function
;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
kxndx = frac(kxndx+1000.5+((kPosy+kPosX)/2)) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint


;green index values follow
kytrans line p12,p3,p13 ;transverse movement in x plane
kyamp line p14,p3,p15 ;index oscillator amplitude
kyamp = kyamp*.5 ;normalizes oscil amp to index table
kyfreq line p16,p3,p17 ;x plane index oscil frequency
kyndx oscili kGreenValue,(((kVelX+kVelY+10/2)/5)+kGreenValue)/kGreenValue,p18 ;p11=x index function
;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
kyndx = frac(kyndx+1000.5+((kPosy+kPosX)/2)) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint


;Blue index values follow
kntrans line p12,p3,p13 ;transverse movement in x plane
knamp line p14,p3,p15 ;index oscillator amplitude
knamp = kyamp*.5 ;normalizes oscil amp to index table
knfreq line p16,p3,p17 ;x plane index oscil frequency
knndx oscili kBlueValue,(((kVelX+kVelY+10/2)/5)+kBlueValue)/kBlueValue,p18 ;p11=x index function
;try sines, traingles, or ascending lines from -1 to +1 
;(phasor) etc for index function
knndx = frac(knndx+1000.5+((kPosy+kPosX)/2)) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint


ax tablei kxndx,p19,1,0,0 ;normalized (-1 to +1) audio for r plane
ay tablei kyndx,p20,1,0,0 ;normalized (-1 to +1) audio for g plane
an tablei knndx,p21,1,0,0 ;normalized (-1 to +1) audio for b plane
az = ((ax+ay+an)*(ax-ay-an))*kenv ;tracks z plane to generate terrain waveform
outs (az*0.2)*kAlphaValue,(az*0.2)*kAlphaValue
gaL = ((ax+ay+an)*(ax-ay-an))*kAlphaValue
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


/***************************/ 
 
;~~~~~~~~~~~~~~~~~~ 
; PITCHSHIFTER UDO 
;~~~~~~~~~~~~~~~~~~ 
 
opcode PitchShifter, aa, aakkk 
 
aL, aR, kpitch, kfine, kfeedback xin 
setksmps 64 
ifftsize = 1024 
ihopsize = 256 
kscal = octave((int(kpitch)/12)+kfine) 
 
aOutL init 0 
aOutR init 0 
 
fsig1L pvsanal aL + (aOutL * kfeedback), ifftsize, ihopsize, ifftsize, 0 
fsig1R pvsanal aR + (aOutR * kfeedback), ifftsize, ihopsize, ifftsize, 0 
fsig2L pvscale fsig1L, kscal 
fsig2R pvscale fsig1R, kscal 
aOutL pvsynth fsig2L 
aOutR pvsynth fsig2R 
 
xout aOutL, aOutR 
endop 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~; 

instr 3 ; PITCH SHIFTER 
 
ktoggle chnget "SecondtSwitch" 
 
if (ktoggle == 1) then 
 
kmix chnget "pitchshifter_mix" 
kpitch chnget "pitchshifter_pitch" 
kpitch scale kpitch, 12, -12 
kfine chnget "pitchshifter_fine" 
kfine scale kfine, 0.083333, -0.083333 
kfeedback chnget "pitchshifter_feedback" 
 
kWet table kmix, giWet, 100 
kDry table kmix, giDry, 100 
 
aOutL, aOutR PitchShifter gaL, gaR, kpitch, kfine, kfeedback 
 
; DECLICKING ENVELOPE 
 
kenv linseg 0, 0.050, 0, 0.25, 1, 1000000, 1 
aOutL = (gaL * (1.0 - kenv)) + (kenv * aOutL) 
aOutR = (gaR * (1.0 - kenv)) + (kenv * aOutR) 
 
; SUM AND BALANCE 
 
aOutL sum gaL * kDry, aOutL * kWet 
aOutR sum gaR * kDry, aOutR * kWet 
gaL balance aOutL, gaL 
gaR balance aOutR, gaR 
 
endif 
endin 
 
/***************************/ 


</CsInstruments>
<CsScore>
f 1 0 8192 10 1 ;sine
f 2 0 8192 7 0 2048 1 4096 -1 2048 0 ;triangle
f 3 0 8192 7 -1 8192 1 ;phasor from -1 to +1


f 10 0 8192 10 0 0 1 ;3 sines
f 11 0 8192 10 1 .43 0 .25 .33 .11 0 .75 ;more complicated terrain
f 12 0 8192 9 9.75 1 0 2.25 1 0 ;zeros out due to end of cycle cancellation
f 13 0 8192 9 1.66 1 0 3.33 1 0 ;zeros out due to end of cycle cancellation
f14 0 8192 9 1.25 1 0 4.25 1 180 ;zeros out due to table end phase inversion
f15 0 8192 9 1 1 0 1.5 1 0
f16 0 8192 9 3 1 0 3.5 1 0


;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table


;i1 0 3600 32000 0 0 1 1 2 2 3 0 0 1 1 40 40 3 1 10 2 10 ;file terrain.1x3sine phasor
;i1 1 .5 32000 0 0 1 1 40 40 3 0 0 1 1 2 2 3 1 10
;i1 0 2 32000 -.5 .5 .1 .1 440 440 3 0 0 1 1 440 440 3 1 10 ;file terrain.1x3sine with
;i1 0 3600 32000 0 0 1 1 440 440 3 -.5 .5 .1 .1 440 440 3 1 10 3 8 ;moving orbits
;i1 0 2 32000 -.5 .5 .1 10 110 110 3 0 3 3 1 110 110 3 1 10 ;file terrain.1x3sine with
;i1 0 3600 32000 .25 -.25 3 1 110 110 3 -.5 .5 .1 10 110 110 3 1 10 1 10 ;moving orbits2
;i1 0 2 32000 -.5 .5 .1 10 110 110 3 0 3 3 1 110 110 3 13 14 ;file terrain.other1 with
;i1 2.5 2 32000 .25 -.25 3 1 110 110 3 -.5 .5 .1 10 110 110 3 11 12 ;moving orbits
;i1 0 2 32000 -.5 .5 .1 1 440 435 3 0 0 1 .1 440 440 3 1 10 ;file terrain.1x3phasing
;i1 2.5 2 32000 0 0 1 .1 110 110 3 -.5 .5 .1 1 330 333 3 1 10 ;moving orbits
;i1 0 2 32000 -.5 .5 .2 .4 110 110 1 0 4 .4 .2 220 220 1 15 16 ;file terrain.other2
;i1 2.5 2 32000 10 0 .5 .2 110 110 3 -.5 .5 .2 .5 220 220 1 15 16 ;moving orbits
i1 0 3600 32000 1. -0.5 .2 .4 110 110 1 3 4 .4 .2 220 220 1 12 2 16 ;file terrain.other2
;i1 12.5 10 32000 10 0 .5 .2 110 110 3 -.5 .5 .2 .5 220 220 1 1 10 ;moving orbits
i2 0 3600



e
</CsScore>


</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>400</width>
 <height>140</height>
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
