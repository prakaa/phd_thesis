# PhD Thesis - Abhijith Prakash

This repository contains my PhD thesis.

**Balance of Power: Designing operational practices for balancing electricity markets with growing penetrations of renewable energy**

The thesis is available via [UNSWorks](http://hdl.handle.net/1959.4/103258) (open-access).

## Summary

Massive deployments of solar and wind generation mean that power systems worldwide are beginning to experience high penetrations of variable renewable energy. Given the challenges and opportunities posed by these resources to the effective and efficient balancing of supply and demand in power systems, policy-makers are revisiting the design of power system operational practices such as grid codes, system operator processes and, in jurisdictions with wholesale competition, electricity markets. 

In this thesis, I explore how policy-makers should approach designing operational practices for balancing electricity markets. Because the design process is complex, contested and contextual, I employ an empirical approach that leverages experience from the Australian National Electricity Market (NEM). 

Frequency control services are critical to ensuring that imbalances are quickly addressed. In this thesis, I first explore the features needed in arrangements for procuring frequency control services during energy transition. Through a comprehensive international review and an assessment of the NEM, I offer four insights on designing frequency control arrangements as power systems transition. 

Increased balancing flexibility will be required during energy transition. Market arrangements should be assessed to determine whether they can deliver sufficient flexibility. As a contribution to this assessment, I investigate how balancing flexibility capabilities in scheduling timeframes are changing during energy transition using historical and projected resource mixes for two regions of the NEM. Based on the findings, I recommend that policy-makers examine how existing arrangements can be augmented to elicit upwards flexibility provision, and that duration specifications and sustained footroom procurement be considered for reserve products. 

Market participants must be willing and able to offer balancing flexibility into wholesale spot markets. As such, I explore how market knowledge processes and participation rules can be configured to maximise balancing flexibility provision. From an analysis of centralised price forecasts from the NEM, I find that errors in these forecasts are increasing in frequency and severity and, as such, arbitrage revenues can be reduced by 15-60+% should these forecasts be used to guide battery energy storage scheduling. I recommend that policy-makers increase the frequency at which forecasts are published and consider market participation restrictions. 

## How to compile the thesis from source

This uses the following template, with contributions from myself:

> Tom Pollard et al. (2016). [Template for writing a PhD thesis in Markdown](https://github.com/tompollard/phd_thesis_markdown). Zenodo. http://dx.doi.org/10.5281/zenodo.58490

### How it works

1. Markdown (`.md`) source files are located in `source`. These should be numbered using at least two characters (i.e. `0x` for 0 <= x < 10) in an order that you want the document to be compiled in. Read the `pandoc` [User Guide](https://pandoc.org/MANUAL.html) for information on syntax for figures, tables, etc. Referencing (citations/figures/tables) is handled using [`pandoc-crossref`](https://lierdakil.github.io/pandoc-crossref/), which you will need to install.
2.  [`pandoc`](https://pandoc.org/) can then be called to compile the Markdown source files to `docx`, `.tex`, `.pdf` and `.html` outputs. The following configure how pandoc compiles these outputs:
    - `source/metadata.yml` provides metadata in YAML format to `pandoc` for **all** formats
    - `source/references.bib` is the bibiliography for **all** formats
    - `style` contains:
      - Templates for `.tex/.pdf` and `.html`
      - A `preamble.tex` file, which is used as a header file for the `.tex` output. You should put LaTeX config in`preamble.tex`
      - A CSL (citation style) file. Replace with the CSL you want and change the CSL name in `source/metadata.yml`
                    
    - `filters` contains Lua filters that enable short captions in the List of Figures/Tables for `.tex/.pdf` output (in lieu of longer figure/table captions). Click links for [figure short captions syntax](https://github.com/pandoc/lua-filters/tree/master/short-captions) and [table short captions syntax](https://github.com/pandoc/lua-filters/tree/master/table-short-captions).
3. For `.tex/.pdf`, `pandoc` can't handle a few things right (wrapping text in multirow/column tables and subfigure short captions). I have hacked around this by using `sed` to modify the `.tex` that `pandoc` generates, before running `latexmk` to convert `.tex` to `.pdf`. If you remove these hacks (remove `sed` calls in Makefile), you can use `pandoc` to directly compile to `.pdf` (i.e. change `make pdf` to a `pandoc` call).
4. `output` contains outputs. If GitHub Pages is enabled for the repo, you can view the HTML output online. I have enabled [hypothes.is](https://web.hypothes.is/) comments, which allows someone to add comments to the HTML page (these will be retained as the HTML output is updated). The HTML output uses components in `output/css` and `output/source`.

### How to use

1. Install pandoc 3.0+
2. Install `pandoc-crossref`. You can build it from source by installing `stack` (`make install_stack`) and then by running `make install_pandoc_filters`
3. The Makefile contains commands to build outputs.
    - Ensure GNU Make is installed
    - Rewrite the `copy_bib` command as need be (based on my file system), or remove altogether
    - Run `make pdf`, `make html`, `make docx` or `make tex` to generate the appropriate output. Prior to running `pandoc`, these commands will run `copy_bib` to ensure the local `.bib` file is up to date.
    - Alternatively, you can run `make all` to make all outputs

4. A GitHub action (`static.yml`) hosts the HTML output (`index.html`) on the repository page
    - Pages must be enabled for the repository
    - The `pandoc` HTML template enables a [`hypothes.is`](https://web.hypothes.is/) toolbar which can be used for annotations/commenting
    - This URL cannot be made private unless you are a GitHub Enterprise member
