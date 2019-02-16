<CsoundSynthesizer>
;
; $Id: osc.csd,v 0.0 2004/11/23 00:46:22 nicb Exp $
;
;<CsOptions>
;</CsOptions>
; ==============================================
<CsInstruments>
	sr	=	44100
	kr	=	441
	ksmps	=	100
	nchnls	=	1

		instr 1	

aout	oscil	10000,440,1
		out		aout

		endin

</CsInstruments>
; ==============================================
<CsScore>
f1 0 4096 10 1

i1 0 3

</CsScore>
</CsoundSynthesizer>

