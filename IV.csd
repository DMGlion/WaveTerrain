Csound Haiku - IV
Iain McCurdy, 2011.

<CsoundSynthesizer>

<CsOptions>
-o dac
-+rtmidi=null
-d
</CsOptions>

<CsInstruments>
sr 		= 		44100
ksmps 		= 		32
nchnls 		= 		2
0dbfs 		= 		1




;gisine		ftgen	     0, 0, 4096, 10, 1


gisine		ftgen	     2, 0, 16384, 10, 1, 0 , .33, 0, .2 , 0, .14, 0 , .11, 0, .09

gioctfn		ftgen		0, 0, 4096, -19, 1, 0.5, 270, 0.5
gasendL		init		0
gasendR		init		0
ginotes		ftgen		0, 0, -100, -17, 0, 8.00, 10, 8.03, 15, 8.04, 25, 8.05, 50, 8.07, 60, 8.08, 73, 8.09, 82, 8.11
		seed		0
;		alwayson	"trigger_notes"
;		alwayson	"reverb"

		instr		1
		kaHarm chnget "HarmM";HarmM
		
		
krate		rspline		0.04, kaHarm, 0.05, kaHarm
ktrig		metro		krate
gktrans		init		0
gktrans		trandom		ktrig,-1, 1
gktrans		=		semitone(gktrans)

		schedkwhen	ktrig, 0, 0, 2, rnd(2), kaHarm*3
		schedkwhen	ktrig, 0, 0, 2, rnd(2), kaHarm*3
		schedkwhen	ktrig, 0, 0, 2, rnd(2), kaHarm*3
		schedkwhen	ktrig, 0, 0, 2, rnd(2), kaHarm*3
		endin

		instr		2
		kampvol chnget "ampVal"
		imode chnget "EQu"
		kval chnget "kv"
		iKc  chnget "kc"
		kq  chnget "kq"
		kpanb  chnget "kpan"
		
		
ipch		table		int(rnd(100)),ginotes
icps		=		cpspch(ipch)*i(gktrans)*semitone(rnd(0.5)-0.25)
kamp		expseg		0.001,0.02,0.2,p3-0.01,0.001
ktonemoddep	jspline		0.01,0.05,0.2
ktonemodrte	jspline		6,0.1,0.2
ktone		oscil		ktonemoddep,ktonemodrte,gisine
kbrite		rspline		-2,3,0.0002,3
ibasfreq	init		icps
ioctcnt		init		2
iphs		init		0
a1 		hsboscil 	kamp, ktone, kbrite, ibasfreq, gisine, gioctfn, ioctcnt, iphs	
amod		oscil		1, ibasfreq*3.47, gisine
arm		=		a1*amod
kmix		expseg		0.001, 0.01, rnd(1), rnd(3)+0.3, 0.001
a1		ntrpol		a1, arm, kmix
a1 		pareq 		a1/10, 400, 15, .707
a1		tone		a1, 500
kpanrte		jspline		5, 0.05, 0.1
kpandep		jspline		0.9, 0.2, 0.4
kpan		oscil		kpandep, kpanrte, gisine
a1,a2		pan2		a1, kpan
a1		delay		a1, rnd(0.1)
a2		delay		a2, rnd(0.1)
kenv		linsegr		1, 1, 0


;Filter
  ifc     =       10000                       ; Center / Shelf
                                             ; kq Quality factor sqrt(.5) is no resonance
  kv      =       ampdb(kval)                ; Volume Boost/Cut
                         ; Mode 0=Peaking EQ, 1=Low Shelf, 2=High Shelf
  kfc     linseg  ifc*2, iKc, ifc/2



a1		=		a1*kenv*kampvol
a2		=		a2*kenv*kampvol
		
		
aout    pareq   a1, kfc, kv, kq, imode
aout1   pareq   a2, kfc, kv, kq, imode
aout3 = aout*3
aout4 = aout1*3
chnset aout3*(1-kpanb)*2, "2"
chnset aout4*kpanb*2, "1"
outs		aout*(1-kpanb)*2, aout1*kpanb*2
		
gasendL		=		gasendL+a1/5
gasendR		=		gasendR+a2/5


		endin

		
		instr		3
		kampRev chnget "EffRev"
		kampvol chnget "ampVal"
		kpanb  chnget "kpan" 
		
	
aL, aR		reverbsc	gasendL, gasendR, kampRev, 10000

		outs		aL*kampvol*(1-kpanb)*2,aR*kampvol*kpanb*2
		

	      clear		gasendL, gasendR
		
		endin
		
	  
</CsInstruments>

<CsScore>
f 0 3600
i 1 0 3600
i 3 0 3600




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
