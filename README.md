# PhD Thesis - Abhijith Prakash

This repository contains my PhD thesis.

## How it works

1. Markdown (`.md`) source files are located in `source`. These should be numbered using at least two characters (i.e. `0x` for 0 <= x < 10) in an order that you want the document to be compiled in. Read the `pandoc` [User Guide](https://pandoc.org/MANUAL.html) for information on syntax for figures, tables, etc. Referencing (citations/figures/tables) is handled using `[pandoc-crossref](https://lierdakil.github.io/pandoc-crossref/)`, which you will need to install.
2.  [`pandoc`](https://pandoc.org/) can then be called to compile the Markdown source files to `docx`, `.tex`, `.pdf` and `.html` outputs. The following configure how pandoc compiles these outputs:
    - `source/metadata.yml` provides metadata in YAML format to `pandoc` for **all** formats
    - `source/references.bib` is the bibiliography for **all** formats
    - `style` contains:
      - Templates for `.tex/.pdf` and `.html`
      - A `preamble.tex` file, which is used as a header file for the `.tex` output. You should put LaTeX config in`preamble.tex`
      - A CSL (citation style) file. Replace with the CSL you want and change the CSL name in `source/metadata.yml`
                    
    - `filters` contains Lua filters that enable short captions in the List of Figures/Tables for `.tex/.pdf` output (in lieu of longer figure/table captions). Click links for [figure short captions syntax](https://github.com/pandoc/lua-filters/tree/master/short-captions) and [table short captions syntax](https://github.com/pandoc/lua-filters/tree/master/table-short-captions).
3. For `.tex/.pdf`, `pandoc` can't handle a few things right (wrapping text in multirow/column tables and subfigure short captions). I have hacked around this by using `sed` to modify the `.tex` that `pandoc` generates, before running `latexmk` to convert `.tex` to `.pdf`. If you remove these hacks, you can use `pandoc` to directly compile to `.pdf`.
4. `output` contains outputs. If GitHub Pages is enabled for the repo, you can view the HTML output online. I have enabled [hypothes.is](https://web.hypothes.is/) comments, which allows someone to add comments to the HTML page (these will be retained as the HTML output is updated). The HTML output uses components in `output/css` and `output/source`.

## How to use

1. The Makefile contains commands to build outputs.
    - Ensure GNU Make is installed
    - Rewrite the `copy_bib` command as need be (based on my file system), or remove altogether
    - Run `make pdf`, `make html`, `make docx` or `make tex` to generate the appropriate output. Prior to running `pandoc`, these commands will run `copy_bib` to ensure the local `.bib` file is up to date.
    - Alternatively, you can run `make all` to make all outputs

2. A GitHub action (`static.yml`) hosts the HTML output (`index.html`) on the repository page
    - Pages must be enabled for the repository
    - The `pandoc` HTML template enables a [`hypothes.is`](https://web.hypothes.is/) toolbar which can be used for annotations/commenting
    - This URL cannot be made private unless you are a GitHub Enterprise member

## Template

This uses the following template (needs to be cited in Acknowledgements):

> Tom Pollard et al. (2016). Template for writing a PhD thesis in Markdown. Zenodo. http://dx.doi.org/10.5281/zenodo.58490
