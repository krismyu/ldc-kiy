(TeX-add-style-hook "triangle2-tikz"
 (lambda ()
    (TeX-add-symbols
     "rightanglelength")
    (TeX-run-style-hooks
     "tikz"
     "latex2e"
     "standalone10"
     "standalone")))

