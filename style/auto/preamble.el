(TeX-add-style-hook
 "preamble"
 (lambda ()
   (LaTeX-add-environments
    '("figure" LaTeX-env-args ["argument"] 0)))
 :plain-tex)

