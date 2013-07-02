(TeX-add-style-hook "venn-tikz"
 (lambda ()
    (TeX-add-symbols
     '("gettikzxy" 3))
    (TeX-run-style-hooks
     "tikz"
     "latex2e"
     "art10"
     "article")))

