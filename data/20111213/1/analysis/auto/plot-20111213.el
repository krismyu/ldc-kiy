(TeX-add-style-hook "plot-20111213"
 (lambda ()
    (LaTeX-add-labels
     "fig:plot-all-by-tone"
     "fig:plot-w1"
     "fig:plot-w2"
     "fig:plot-w2-facet")
    (TeX-run-style-hooks
     "timestamp"
     "lastpage"
     "fancyhdr"
     "subfig"
     "Sweave"
     "longtable"
     "inputenc"
     "utf8"
     "amssymb"
     "amsmath"
     "graphics"
     "natbib"
     "latex2e"
     "art10"
     "article")))

