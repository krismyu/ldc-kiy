(TeX-add-style-hook "period-tikz"
 (lambda ()
    (TeX-run-style-hooks
     "pgfplots"
     "tikz"
     "latex2e"
     "standalone10"
     "standalone")))

