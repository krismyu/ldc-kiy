(TeX-add-style-hook "resolution-tikz"
 (lambda ()
    (TeX-add-symbols
     "markopts")
    (TeX-run-style-hooks
     "pgfplots"
     "latex2e"
     "art10"
     "article")))

