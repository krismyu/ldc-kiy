(TeX-add-style-hook "plot-20111208"
 (lambda ()
    (LaTeX-add-labels
     "fig:plot-mess"
     "fig:plot-iso"
     "fig:plot-target"
     "fig:plot-targets-niso"
     "fig:plot-targets-niso-mess"
     "fig:plot-frame"
     "fig:plot-iso-lex"
     "fig:plot-niso-syll-lex")
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

