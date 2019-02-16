#
# $Id: Makefile 8 2014-02-04 21:01:21Z nicb $
#
# Charts maker
#
OBJS= aula4.eps soa.pdf
PIC=pic
GROFF=groff
GS=gs
FIG2DEV=fig2dev
DIA2EPS=dia -t eps-builtin
CONVERT=convert
IS2PDF=inkscape 

all:	$(OBJS)

clean:
	$(RM) $(OBJS) *.bak

.SUFFIXES: .pdf .eps .tex .pic .fig .dia .jpg .svg

%.tex:	%.pic
	$(PIC) -t $< > $@

%.eps:	%.pic
	$(GROFF) -p -mpic $< | $(GS) -sDEVICE=epswrite -sOutputFile=- \
		-q - > $@

%.eps:	%.fig
	$(FIG2DEV) -L eps -l 0 $< $@

%.eps:	%.dia
	$(DIA2EPS) $<

%.eps:	%.jpg
	$(CONVERT) $< $@

%.pdf: %.svg
	$(IS2PDF) -A $@ $<
