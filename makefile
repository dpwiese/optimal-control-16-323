# Project directories
CWD := $(abspath $(shell pwd))
SRC := $(CWD)/src
OUT := $(CWD)/out
BIB := $(CWD)/bib

# Set engine (works with pdflatex, unknown about xelatex or luatex)
ENGINE := pdflatex

# Every source .tex file should correspond to a .pdf output file
SRC_FILES := $(wildcard $(SRC)/*.tex)

.PHONY: pdf clean lint
.SILENT: pdf clean lint

pdf: $(subst src,out,$(subst .tex,.pdf, $(SRC_FILES)))

clean:
	- rm -f $(OUT)/*

$(OUT):
	mkdir -p $@

$(OUT)/%.pdf: $(SRC)/%.tex $(BIB)/%.bib | $(OUT)
	@mkdir -p $(dir $@) \
	&& cd $(dir $<) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd $(dir $@) && openout_any=a bibtex $(notdir $(basename $@)) && cd $(dir $<) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd ..

$(OUT)/%.pdf: $(SRC)/%.tex | $(OUT)
	@mkdir -p $(dir $@) \
	&& cd $(dir $<) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd ..

lint:
	chktex -I0 -l $(SRC)/.chktexrc $(SRC_FILES)
	$(foreach x, $(SRC_FILES), lacheck $(x);)