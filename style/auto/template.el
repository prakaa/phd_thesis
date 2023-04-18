(TeX-add-style-hook
 "template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("$documentclass$" "$if(fontsize)$$fontsize$" "$endif$$if(lang)$$lang$" "$endif$$if(papersize)$$papersize$" "$endif$$for(classoption)$$classoption$$sep$" "$endfor$")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("geometry" "$for(geometry)$$geometry$$sep$" "$endfor$") ("hyperref" "setpagesize=false" "unicode=false" "xetex" "unicode=true") ("ulem" "normalem") ("babel" "$lang$")))
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "code")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "$documentclass$"
    "$documentclass$10"
    "$fontfamily$"
    "lmodern"
    "float"
    "truncate"
    "caption"
    "tocloft"
    "setspace"
    "amssymb"
    "amsmath"
    "ifxetex"
    "ifluatex"
    "fixltx2e"
    "fontenc"
    "inputenc"
    "eurosym"
    "mathspec"
    "xltxtra"
    "xunicode"
    "fontspec"
    "upquote"
    "microtype"
    "geometry"
    "natbib"
    "biblatex"
    "listings"
    "fancyvrb"
    "longtable"
    "booktabs"
    "graphicx"
    "hyperref"
    "ulem"
    "polyglossia"
    "babel"
    "calc")
   (TeX-add-symbols
    '("CSLIndent" 1)
    '("CSLRightInline" 1)
    '("CSLLeftMargin" 1)
    '("CSLBlock" 1)
    '("href" 2)
    "tightlist"
    "euro"
    "maxwidth"
    "maxheight")
   (LaTeX-add-environments
    '("figure" LaTeX-env-args ["argument"] 0)
    '("CSLReferences" 2))
   (LaTeX-add-bibliographies
    "$biblio-files$")
   (LaTeX-add-lengths
    "cslhangindent"
    "csllabelwidth"))
 :latex)

