# Project directories
CWD := $(abspath $(shell pwd))
SRC := $(CWD)/src
OUT := $(CWD)/out
BIB := $(CWD)/bib

# Set engine (works with luatex, unknown about xelatex or pdflatex)
ENGINE := pdflatex

# Every source .tex file should correspond to a .pdf output file
SRC_FILES := $(wildcard $(SRC)/*.tex) $(wildcard $(SRC)/*/*.tex)
# OUT_FILES := $(subst src,out,$(subst .tex,.pdf, $(SRC_FILES)))

.PHONY: pdf clean lint
.SILENT: pdf clean lint

pdf: $(subst src,out,$(subst .tex,.pdf, $(SRC_FILES)))

clean:
	- rm -f $(OUT)/*

$(OUT):
	mkdir -p $@

$(OUT)/%.pdf: $(SRC)/%.tex $(BIB)/%.bib | $(OUT)
	@mkdir -p $(dir $@) \
	&& cd $(SRC) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd $(OUT) && openout_any=a bibtex $(notdir $(basename $@)) && cd $(SRC) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd ..

$(OUT)/%.pdf: $(SRC)/%.tex | $(OUT)
	@mkdir -p $(dir $@) \
	&& cd $(SRC) \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& openout_any=a $(ENGINE) --jobname=$(notdir $(basename $@)) --output-directory=$(dir $@) --file-line-error --shell-escape --synctex=1 $< \
	&& cd ..

lint:
	chktex -I0 -l $(SRC)/.chktexrc $(SRC_FILES)
	$(foreach x, $(SRC_FILES), lacheck $(x);)