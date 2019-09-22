<CsoundSynthesizer>
<CsOptions>
-odac           -iadc     -d 
</CsOptions>
<CsInstruments>




sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

gisine ftgen 3, 0, 256, 10, 1, 0, 0, .4		;sinoid
gisaw  ftgen 4, 0, 1024, 7, 0, 256, 1		;saw


instr 1
 kenv linen 1, 1, 2, .9
 
 kxtrans line 100, 2, 600
 kxamp line 300, 2, 200
 kxamp = kxamp*.5
 kxfreq line 300, 2, 600
 kxndx oscili kxamp, kxfreq, 2
 kndx = frac(kxndx+1000.5+kxtrans)
 
 
 kytrans line 150, 2, 200
 kyamp line 200, 2, 400
 kyamp = kyamp*.5
 kyfreq line 300, 2, 100
 kyndx oscili kyamp, kyfreq, 4
 kndy = frac(kyndx+1000.5+kytrans)
 
 ax = kxndx
 ay = kyndx
  
 az = (ax*ay)*kenv
 out az,az
 endin

 
 

</CsInstruments>
<CsScore>
f1      0       8192    10      .1 0.3 0.33 0 0.2 0 0.14 0.4 0.11
f2      0       4096    10      .2
 
 i1 0 4 
e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>22</y>
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
