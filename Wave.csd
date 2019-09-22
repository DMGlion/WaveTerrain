
;                              	Csound for iOS API - A Beginner's Guide
;              				 	Department of Electronics
;						 	    University of York
;				     Timothy Neate, Nicholas Arner and Abigail Richardson
;				   				     9/4/13		
;
;


<CsoundSynthesizer>
<CsOptions>

-o dac
-+rtmidi=null
-d

</CsOptions>
<CsInstruments>

sr = 44100		
ksmps = 64 ; sr/kr
nchnls = 2
0dbfs  = 1

instr 1


;chnget retrieves some data from the channel 'sliderVal' and assigns it to a control rate variable. 
;sliderVal is an objective-c pointer". It retrives the information at this memory address at a frequency defined by the control rate.

kfreq1 chnget "xView"
kamp1 chnget "yView"
  
kfreq1 chnget "VxView"
kamp1 chnget "VyView"

kfreq = kfreq1
kamp = kamp1
; aSimpleOscillator's parameters are controlled by the amplitude and frequency variables coming from iOS

asigL oscil kamp*100,kfreq*100,1

asigR oscil kamp1,kfreq1,1


;Send the same signal (asig) through each channel
outs asigL,asigR

;End instrument
endin

</CsInstruments>
<CsScore>

;Creates a function-table using GEN routine #10, which generates a sine wave using a table consisting of 16384 points
f1 0 16384 10 1

;Play for 10000 seconds
i1 0 10000  
e
</CsScore>
</CsoundSynthesizer> 
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>256</x>
 <y>133</y>
 <width>200</width>
 <height>645</height>
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
