# R script based on bioconductor/devel_base2
# <https://github.com/Bioconductor/bioc_docker/blob/master/out/release_base/>

url <- "http://bioconductor.org/packages/3.5/bioc"

if ("BiocInstaller" %in% rownames(installed.packages()))
	remove.packages("BiocInstaller")

install.packages("BiocInstaller", repos = url)

pkgs <- c("org.Hs.eg.db", "TxDb.Hsapiens.UCSC.hg38.knownGene",
    "TxDb.Hsapiens.UCSC.hg19.knownGene", "AnnotationDbi",
    "BiocGenerics", "dplyr", "DT", "GenomeInfoDb", "GenomicFeatures",
    "purrr", "S4Vectors", "shiny", "shinydashboard", "shinyjs", "tidyr",
    "Biostrings", "GenomicRanges", "httr", "IRanges", "jsonlite",
    "VariantAnnotation", "devtools")

for (pkg in pkgs)
    if (!suppressWarnings(require(pkg, character.only = TRUE)))
        BiocInstaller::biocLite(pkg)

suppressWarnings(BiocInstaller::biocValid(fix = TRUE, ask = FALSE))

devtools::install_github("labbcb/GA4GHclient")
devtools::install_github("labbcb/GA4GHshiny")
