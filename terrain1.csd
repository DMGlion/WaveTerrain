<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac           -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o wterrain.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

gisine ftgen 3, 0 ,     16384,    10, .8,.3,.5,.6

instr 1

k_xcenter chnget "xView"
k_ycenter chnget "yView"
  
k_yradius chnget "Red"
kdclk chnget "Green"

k_xradius1 chnget "VxView"
k_yradius1 chnget "VyView"

k_xradius=k_xradius1+10
k_yradius=k_yradius1+10
;kdclk   linseg  0, 0.01, 1, p3-0.02, 1, 0.01, 0
;kcx     line    0.1, p3, 1.9
;krx     linseg  0.1, p3/2, 0.5, p3/2, 0.1
;kpch    line    cpspch(p4), p3, p5 * cpspch(p4)
;a1      wterrain    10000, k_ycenter/10, k_xradius/30, k_yradius/30, k_xcenter/30, k_ycenter/30, 1, 2

a1      wterrain    10000, k_ycenter/10, k_xcenter/100, k_ycenter/100, k_xradius/100, k_yradius/100, 2, 2
a1      dcblock a1
        out     a1*kdclk, a1*kdclk
endin


instr 2

k_x chnget "xView"
k_y chnget "yView"

kmod chnget "c"
ival chnget "c"
iamp1 chnget "c"



iamp = iamp1*5000


kcps = (k_x+k_y)*5 
kcar = (k_x+k_y)/2



kndx line 0, ival, 1	;intensivy sidebands

asig foscil 5000, kcps, kcar, kmod, kndx, 3
     outs asig, asig

endin


</CsInstruments>
<CsScore>

f1      0       8192    10      1 0 0.33 0 0.2 0 0.14 0 0.11
f2      0       4096    10      1
;f3      0      16384    10      1


i1      0       3600  
i2      0       3600     
;i1      4       4       6.07 1 1 2
;i1      8       8       6.00 1 2 2
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
