# Installation des packages de R ####
options(pkgType="binary")
options(install.packages.check.source="no")
InstallPackages <- function(Packages) {
  sapply(Packages, function(Package) 
    if (!Package %in% installed.packages()[, 1]) {install.packages(Package)})
}

# Rtools : déclaration du chemin, nécessite de redémarrer RStudio ####
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
# Rtools pacman : installation des packages C++
system2("pacman", args="-Sy")                                       # Initialisation
system2("pacman", args="-S mingw-w64-x86_64-intel-tbb --noconfirm") # Pour RcppParallel

# Identification pour git
InstallPackages("usethis")
usethis::use_git_config(user.name = "Prenom Nom", 
                        user.email = "prenom.nom@organisation.fr")


# Outils de développement ####
InstallPackages(c("devtools",   # Outils de développement. Importe remotes, etc.
                  "rcmdcheck",  # Exécution de Check par RStudio
                  "formatR",    # Formatage du code R (utilisé par knitr)
                  "pkgdown",    # Documentation des packages sur GitHub
                  "Rdpack",     # Biblio avec roxygen
                  "rbenchmark", # Mesure des performances
                  "roxygen2",   # Documentation automatique des packages
                  "testthat"    # Tests des packages
                  ))


# Markdown ####
InstallPackages(c("knitr",      # Tricot
                  "bookdown",   # Documents markdown complexes
                  "blogdown",   # Sites web
                  "memoiR",     # Modèles
                  "xaringan",   # Modèle de présentation
                  "rticles"     # Modèles d'articles
                  ))


# Tidyverse ####
InstallPackages("tidyverse")


# Graphiques ####
InstallPackages(c("gplots",    # Graphiques en 3D
                  "devEMF",    # Figures au format EMF
                  "ragg"       # Rendus graphiques
))
