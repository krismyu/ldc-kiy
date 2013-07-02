(TeX-add-style-hook "sub-tikz"
 (lambda ()
    (TeX-add-symbols
     "ipa")
    (TeX-run-style-hooks
     "tikz"
     "tipa"
     "tone"
     "xcolor"
     "latex2e"
     "standalone10"
     "standalone")))

