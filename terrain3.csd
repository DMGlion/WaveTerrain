<CsoundSynthesizer>
<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=2

instr 1 ;3-D wave terrain with oscils/phasors

;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table

kenv linseg 0,.02,p4,p3-.04,p4,.02,0 ;amp envelope

;x index values follow
kxtrans line p5,p3,p6 ;transverse movement in x plane
kxamp line p7,p3,p8 ;index oscillator amplitude
kxamp = kxamp*.5 ;normalizes oscil amp to index table
kxfreq line p9,p3,p10 ;x plane index oscil frequency
kxndx oscili kxamp,kxfreq,p11 ;p11=x index function
;try sines, traingles, or ascending lines from -1 to +1
;(phasor) etc for index function
kxndx = frac(kxndx+1000.5+kxtrans) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint

;y index values follow
kytrans line p12,p3,p13 ;transverse movement in x plane
kyamp line p14,p3,p15 ;index oscillator amplitude
kyamp = kyamp*.5 ;normalizes oscil amp to index table
kyfreq line p16,p3,p17 ;x plane index oscil frequency
kyndx oscili kyamp,kyfreq,p18 ;p11=x index function
;try sines, traingles, or ascending lines from -1 to +1
;(phasor) etc for index function
kyndx = frac(kyndx+1000.5+kytrans) ;need fractional values
;to go from one terrain boundary to the other
;1000.5 avoids negative values and sets start point
;at table midpoint

ax tablei kxndx,p19,1,0,0 ;normalized (-1 to +1) audio for x plane
ay tablei kyndx,p20,1,0,0 ;normalized (-1 to +1) audio for y plane
az = (ax*ay)*kenv ;tracks z plane to generate terrain waveform
outs az,az
endin

</CsInstruments>
<CsScore>
f 1 0 8192 10 1 ;sine
f 2 0 8192 7 0 2048 1 4096 -1 2048 0 ;triangle
f 3 0 8192 7 -1 8192 1 ;phasor from -1 to +1

f 10 0 8192 10 0 0 1 ;3 sines
f 11 0 8192 10 1 .43 0 .25 .33 .11 0 .75 ;more complicated terrain
f 12 0 8192 9 .75 1 0 2.25 1 0 ;zeros out due to end of cycle cancellation
f 13 0 8192 9 1.66 1 0 3.33 1 0 ;zeros out due to end of cycle cancellation
f14 0 8192 9 1.25 1 0 4.25 1 180 ;zeros out due to table end phase inversion
f15 0 8192 9 1 1 0 1.5 1 0
f16 0 8192 9 3 1 0 3.5 1 0

;p4=amp p5-6=xtransi-f p7-8=xoscilampi-f p9-10=xoscilfreqi-f p11=xfn
;p12-13=ytransi-f p14-15=yoscilampi-f p16-17=yoscilfreqi-f p18=yfn
;p19=x plane fn table p20=y plane fn table

;i1 0 .5 32000 0 0 1 1 2 2 3 0 0 1 1 40 40 3 1 10 ;file terrain.1x3sine phasor
;i1 1 .5 32000 0 0 1 1 40 40 3 0 0 1 1 2 2 3 1 10
;i1 0 2 32000 -.5 .5 .1 .1 440 440 3 0 0 1 1 440 440 3 1 10 ;file terrain.1x3sine with
;i1 2.5 2 32000 0 0 1 1 440 440 3 -.5 .5 .1 .1 440 440 3 1 10 ;moving orbits
;i1 0 2 32000 -.5 .5 .1 10 110 110 3 0 3 3 1 110 110 3 1 10 ;file terrain.1x3sine with
;i1 2.5 2 32000 .25 -.25 3 1 110 110 3 -.5 .5 .1 10 110 110 3 1 10 ;moving orbits2
;i1 0 2 32000 -.5 .5 .1 10 110 110 3 0 3 3 1 110 110 3 13 14 ;file terrain.other1 with
;i1 2.5 2 32000 .25 -.25 3 1 110 110 3 -.5 .5 .1 10 110 110 3 11 12 ;moving orbits
;i1 0 2 32000 -.5 .5 .1 1 440 435 3 0 0 1 .1 440 440 3 1 10 ;file terrain.1x3phasing
;i1 2.5 2 32000 0 0 1 .1 110 110 3 -.5 .5 .1 1 330 333 3 1 10 ;moving orbits
;i1 0 2 32000 -.5 .5 .2 .4 110 110 1 0 4 .4 .2 220 220 1 15 16 ;file terrain.other2
;i1 2.5 2 32000 10 0 .5 .2 110 110 3 -.5 .5 .2 .5 220 220 1 15 16 ;moving orbits
i1 0 10 32000 -.5 .5 .2 .4 110 110 1 0 4 .4 .2 220 220 1 1 2 ;file terrain.other2
i1 12.5 10 32000 10 0 .5 .2 110 110 3 -.5 .5 .2 .5 220 220 1 1 10 ;moving orbits


e
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>200</width>
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
