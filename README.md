# PhD Thesis - Abhijith Prakash

This repository contains my PhD thesis. 

I am using the template below and [`pandoc`](https://pandoc.org/) to write my thesis in markdown and build `.docx`, `.tex`, `.pdf` and `.html` outputs.

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

This uses the following template, which should be cited:

> Tom Pollard et al. (2016). Template for writing a PhD thesis in Markdown. Zenodo. http://dx.doi.org/10.5281/zenodo.58490

### Useful template notes

#### Are there any reasons not to use Markdown?

Note:
- it isn't possible to add a short caption to tables ~~and figures~~ ([figures are now fixed](https://github.com/tompollard/phd_thesis_markdown/pull/47), thanks to @martisak). This means that /listoftables includes the long-caption, which probably isn't what you want. If you want to include the list of tables, then you'll need to write it manually.
- Image size can now be specified. Thanks to @rudolfbyker for [highlighting this](https://github.com/tompollard/phd_thesis_markdown/issues/15)).

#### How does it work?
The universal document converter [`pandoc`](https://pandoc.org/) does all the heavy lifting. For example:

1. `make pdf` (the code under `pdf: ...` in [`Makefile`](./Makefile)) runs `pandoc` which takes as input
    1. the markdown files which contain the writing content: `input/*.md`
    1. a yaml file with metadata: `input/metadata.yml`
    1. a LaTeX template: `style/template.tex`
    1. a LaTeX header: `style/preamble.tex`
    1. a BibTeX file of your references: `input/references.bib`
    1. a csl style file for citations: `style/ref_format.csl`
    1. a bunch of options which change the output e.g. `--number-sections`
1. the output produced is:
    1. the generated pdf: [`output/thesis.pdf`](./output/thesis.pdf)
    1. logs (which contain the `.tex` which was compiled): `pandoc.pdf.log`    

Put simply, `pandoc` uses the latex template provided to create a `.tex` file, then compiles it. In detail, `pandoc` processes the input files in the following way (the file names in quotes aren't visible to you, but are named for the purpose of understanding):
1. Make replacements within the markdown files `input/*.md` e.g.:
    * references to figures, captions, and sections are handled: `@fig:my_fig` -> `\ref{fig:my_fig}`
    * equations are converted to LaTeX and numbered: `$f(x) = ax^3 + bx^2 + cx + d$ {#eq:my_equation}` -> `\begin{equation}f(x) = ax^3 + bx^2 + cx + d\label{eq:my_equation}\end{equation}`
    * citations are handled: `[@Cousteau1963]` -> `(Cousteau Jacques & Dugan James 1963)`
    * see `input/*.md` for more examples!
1. Create "`body.tex`" by:
    * converting all the `*.md` files **in the order that they were stated** in the `pandoc` call
1. Create "`main.tex`" from `style/template.tex` by running code wrapped in `$` signs. The important things to note are:
    * this populates `style/template.tex` with metadata from `input/metadata.yml` and the arguments from the `pandoc` call
    * "`body.tex`" is pasted in verbatim in place of `$body$`
1. Create "`references.tex`" by converting `./input/references.bib`
1. Concatenate files together to create the final `thesis.tex` = `style/preamble.tex` + "`main.tex`" + "`references.tex`"
1. Compile `thesis.tex` (you can see the logs for this process, and what "`thesis.tex`" would look like in `pandoc.pdf.log`)
    * **TIP**: You can also generate and view `output/thesis.tex` by running `make tex` - this follows all the above steps, bar the final compilation

#### What else do I need to know?

Some useful points, in a random order:
- if you only care about generating `thesis.pdf` you can always fall back on writing LaTeX within the markdown files (but note that `theis.html` and other outputs will not be able to render this)
- the markdown files you write (i.e. your chapters) will be compiled in alphabetical order, so keep the filenames sorted in the order you want them to appear e.g. `01_chapter_1.md`, `02_chapter_2.md`, etc. This is required because of the way we have written `make pdf`. You can change this behaviour by writing a custom `pandoc` command instead of using `make pdf`.
- each chapter must finish with at least one blank line, otherwise the header of the following chapter may not be picked up.
- add two spaces at the end of a line to force a line break.
- the template uses [John Macfarlane's Pandoc](http://johnmacfarlane.net/pandoc/README.html) to generate the output documents. Refer to this page for Markdown formatting guidelines.
- PDFs are generated using the LaTeX templates in the style directory. Fonts etc can be changed in the TeX templates.
- To change the citation style, just overwrite ref_format.csl with the new style. Style files can be obtained from [citationstyles.org/](http://citationstyles.org/)
- You can automatically reload the HTML page on your browser using LiveReload with the command `$ npm run livereload`. The HTML page will automatically reload when saving a Markdown file after the export is done.

