all: move rmd2md

move:
    cp inst/vign/ritis_vignette.md vignettes

rmd2md:
    cd vignettes;\
    mv ritis_vignette.md ritis_vignette.Rmd
