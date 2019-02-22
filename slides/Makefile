#
#
TOPDIR=.
TARGET=slides.pdf 
DVI=$(TARGET:.pdf=.dvi)
SRC=$(TARGET):.pdf=.dvi)
AUX=$(TARGET):.pdf=.aux)
CURDIRNAME=SME-Demo
ARGDIRNAME=sections
ARGDIR=$(TOPDIR)/$(ARGDIRNAME)
IMAGEDIRNAME=$(ARGDIRNAME)/immagini
IMAGEDIR=$(TOPDIR)/$(IMAGEDIRNAME)
EXAMPLEDIRNAME=$(ARGDIRNAME)/esempi
EXAMPLEDIR=$(TOPDIR)/$(EXAMPLEDIRNAME)
BEAMERDIR=$(TOPDIR)/templates/sme-ccppd
TEXINPUTS=".:$(BEAMERDIR):$(IMAGEDIR):"
PDFLATEX=TEXINPUTS=$(TEXINPUTS) pdflatex
PDFLATEXINPUT='\newcommand{\printmode}{$(PRINTMODE)}\input{$<}'
SLIDESVERSION=$$(cat .slidesversion)
SLIDESDATE=$$(cat .slidesdate)
DISTNAME_WO_SFX=SME-Demo-$(SLIDESVERSION)-$(SLIDESDATE)
DISTNAME=$(DISTNAME_WO_SFX).pdf
DATADIR=.
LECTURES=01 02 03 04 05 06
ALL_LECTURES=lecture-all.tex
COPY=cp
MOVE=mv
BIBTEX=bibtex
LN=ln -sf
CD=cd
MV=mv
ECHO=/bin/echo -e
MAKEFLAGS+=-w
ZIP=zip -r
METAFILES=.slidesversion .slidesdate
DISTFILE=$(DISTNAME_WO_SFX).zip
PRINTMODE=beamer

all: target

target:	examples images
	$(MAKE) -$(MAKEFLAGS) realtarget

onelecture: examples images
	$(MAKE) -$(MAKEFLAGS) realtarget

alldist: distlectures dist

dist: $(DISTFILE)

$(DISTFILE): $(METAFILES) examples images
	$(MAKE) -$(MAKEFLAGS) PRINTMODE=article realtarget
	export df=$(DISTNAME_WO_SFX); $(CD) $(TOPDIR); $(ZIP) $${df}.zip $(CURDIRNAME)/$${df}.pdf $(EXAMPLEDIRNAME)/*.[owma]* $(IMAGEDIRNAME)/*.midi
	$(MV) $(TOPDIR)/$(DISTFILE) .


distlectures: images
	for i in $(LECTURES);\
  do\
		$(MAKE) -$(MAKEFLAGS) PRINTMODE=article LECTNOS="-$$i" realtarget;\
	done

realtarget: $(METAFILES)
	$(MAKE) -$(MAKEFLAGS) $(TARGET)
	$(MOVE) $(TARGET) $(DISTNAME)

%.pdf:	%.tex
	$(PDFLATEX) $(PDFLATEXINPUT)
#	$(BIBTEX) $* 
	$(RM) $@
	$(PDFLATEX) $(PDFLATEXINPUT)

images:
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS)

examples:
	$(MAKE) -C $(EXAMPLEDIR) -$(MAKEFLAGS)

distclean:
	$(RM) *~ *.aux *.dvi *.out *.log *.bbl *.blg *.toc *.nav *.snm *.pdf $(DISTFILE) $(METAFILES)

clean: distclean
	$(RM) $(TARGET)
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS) $@
	$(MAKE) -C $(EXAMPLEDIR) -$(MAKEFLAGS) $@

.slidesversion: $(TARGET)
	git show --oneline | head -1 | cut -d ' ' -f 1 > $@

.slidesdate: $(TARGET)
	date +%Y%m%d > $@

.PHONY:	distclean images realtarget

.SUFFIXES:	.pdf .ps .dvi .aux .tex
