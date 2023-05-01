.PHONY: help copy_bib install_pandoc_filters install_stack clean

#################################################################################
# GLOBALS                                                                       #
#################################################################################
BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style
SCRATCHDIR=$(BASEDIR)/scratch
PANDOC_DIR=/home/abi/.local/share/pandoc
LUA_FILTERS_RELEASE_URL=https://github.com/pandoc/lua-filters/releases/latest

BIBFILE=$(INPUTDIR)/references.bib
#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Copy bib file from master bib file synced with Zotero
copy_bib:
	@echo ">>> Copying bib file"
	cp ~/version_control/ResearchNotes/zoterolibrary.bib ~/version_control/phd_thesis/source/references.bib

## Install LaTeX libraries on Linux systems
install_latex:
	@echo ">>> Installing LaTeX libraries"
	sudo apt install texlive-base texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-extra-utils texlive-font-utils
	@echo ">>> Installing XeTeX (other fonts)"
	sudo apt install texlive-xetex
	@echo ">>> Installing latexmk (maker)"
	sudo apt install latexmk
	@echo ">>> Installing chktex (linter)"
	sudo apt install chktex
	@echo ">>> Installing latexdiff"
	sudo apt install latexdiff
	@echo ">>> Get TeX and LaTeX docs"
	sudo apt install texlive-latex-recommended-doc texlive-latex-extra-doc

## Install stack (for compiling pandoc filters)
install_stack:
	@echo ">>> Installing stack"
	curl -sSL "https://get.haskellstack.org/" | sh

## Install Pandoc filters
install_pandoc_filters:
	@echo ">>> Installing pandoc lua filters"
	curl -LSs "$(LUA_FILTERS_RELEASE_URL)/download/lua-filters.tar.gz" | \
		tar --strip-components=1 --one-top-level="$(PANDOC_DIR)" -zvxf -
	@echo ">>> Installing pandoc-crossref"
	git clone "https://github.com/lierdakil/pandoc-crossref.git"
	cd pandoc-crossref && git checkout master && stack install
	sudo rm -r pandoc-crossref
	@echo ">>> Installing pandoc-sidenote"
	git clone "https://github.com/jez/pandoc-sidenote" && cd pandoc-sidenote && stack build && stack install
	sudo rm -r pandoc-sidenote

## Clean auxiliary LaTeX files
clean:
	find . -type f -name '*.aux' -delete
	find . -type f -name '*.abs' -delete
	find . -type f -name '*.bbl' -delete
	find . -type f -name '*.blg' -delete
	find . -type f -name '*.fdb_latexmk' -delete
	find . -type f -name '*.fls' -delete
	find . -type f -name '*.out' -delete
	find . -type f -name '*.spl' -delete
	find . -type f -name '*.synctex.gz' -delete
	find . -type f -name '*.toc' -delete
	find . -type f -name '*.xdv' -delete

## Create PDF
pdf: tex
	latexmk -xelatex "$(OUTPUTDIR)/thesis.tex" 2> latexmk.pdf.log -outdir="$(OUTPUTDIR)"
	make clean
	rm "$(OUTPUTDIR)/thesis.log"
	rm "$(OUTPUTDIR)/thesis.lot"
	rm "$(OUTPUTDIR)/thesis.lof"

## Create TeX
tex: copy_bib
	pandoc  \
		--standalone \
		--number-sections \
		--output "$(OUTPUTDIR)/thesis.tex" \
		--template="$(STYLEDIR)/template.tex" \
		--include-in-header="$(STYLEDIR)/preamble.tex" \
		--variable=fontsize:12pt \
		--variable=papersize:a4paper \
		--variable=documentclass:report \
		--pdf-engine=xelatex \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--lua-filter=filters/date-today.lua \
		--filter=pandoc-crossref \
		--bibliography="$(BIBFILE)" \
		--citeproc \
		--csl="$(STYLEDIR)/energy-policy.csl" \
		"$(INPUTDIR)"/*.md \
		"$(INPUTDIR)/metadata.yml" \
		--verbose \
		-f markdown+raw_tex+grid_tables \
		2>pandoc.tex.log
	## My very ungraceful hacks
	## If you remove the sed call below, you can use pandoc to compile straight to PDF
	# SED HACKS:
	# Change multirow{*} to multirow{=} - ensures multirow text wrapped
	# Change p columns to m columns for multirow centering
	# Fix reserves subfigure short caption
	sed -i -f filters/postprocesstex.sed output/thesis.tex
## Create HTML
html: copy_bib
	pandoc  \
		--standalone \
		-f markdown+raw_tex+grid_tables \
		--katex \
		--number-sections \
		--output "$(OUTPUTDIR)/index.html" \
		--template="$(STYLEDIR)/template.html5" \
		--css="css/theme.css" \
		--css="css/skylighting-paper-theme.css" \
		--wrap=none \
		--toc \
		"$(INPUTDIR)"/*.md \
		"$(INPUTDIR)/metadata.yml" \
		--lua-filter=filters/date-today.lua \
		--filter=pandoc-crossref \
		--to=html5+smart \
		--bibliography="$(BIBFILE)" \
		--citeproc \
		--csl="$(STYLEDIR)/energy-policy.csl" \
		--verbose \
		2>pandoc.html.log
	rm -rf "$(OUTPUTDIR)/source"
	mkdir "$(OUTPUTDIR)/source"
	cp -r "$(INPUTDIR)/figures" "$(OUTPUTDIR)/source/figures"

## Create DOCX
docx: copy_bib
	pandoc  \
		--standalone \
		--number-sections \
		--output "$(OUTPUTDIR)/thesis.docx" \
		--toc \
		"$(INPUTDIR)"/*.md \
		"$(INPUTDIR)/metadata.yml" \
		--lua-filter=filters/date-today.lua \
		--filter=pandoc-crossref \
		--bibliography="$(BIBFILE)" \
		--citeproc \
		--csl="$(STYLEDIR)/energy-policy.csl" \
		--verbose \
		-f markdown+raw_tex+grid_tables \
		2>pandoc.docx.log

## Create all
all: pdf tex html docx

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
