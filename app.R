# Shiny application that runs GA4GHshiny connected at one GA4GH server.
# For this example, it connects at "Hosting Thousand Genomes Project".
# <http://1kgenomes.ga4gh.org/>
library(GA4GHshiny)

# Set URL of the GA4GH server endpoint.
host <- "1kgenomes.ga4gh.org"

# Set annotation packages required to 'search by genes' work.
# Set 'NA' for both 'txDb' and 'orgDb' to disable this kind of search feature.
# <https://www.bioconductor.org/help/workflows/annotation/annotation/>
txDb <- "TxDb.Hsapiens.UCSC.hg38.knownGene"
orgDb <- "org.Hs.eg.db"

# Set GA4GH server name. Set 'NA' for 'serverName' to show only URL.
serverName = "Hosting Thousand Genomes Project"

# Run Shiny app
app(host, orgDb, txDb, serverName)