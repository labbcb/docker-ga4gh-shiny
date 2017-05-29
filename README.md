# Docker image for GA4GHshiny package

This Docker image provides the [GA4GHshiny Bioconductor package](https://bioconductor.org/packages/GA4GHshiny) running at [ShinyServer](https://www.rstudio.com/products/shiny/shiny-server/).
By default, it connects to [Hosting Thousand Genomes Project](http://1kgenomes.ga4gh.org/).

To run this image, execute:

``` bash
docker run -d -p 3838:3838 welliton/ga4gh-shiny
```

It will be available at <http://localhost:3838/>.

To change the default GA4GH server endpoint, edit `app.R` file:

``` R
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
```

Execute the changing the default `app.R` file:

``` bash
docker run -v ~/app.R:/srv/shiny-server/app.R -p 3838:3838 welliton/ga4gh-shiny
```

It is possible to have many Shiny applications running at the same server.
Each application should have its own directory.
For example:

- /srv/shiny-server/
  - client1/app.R
  - client2/app.R

## Buiding this image

``` bash
git clone git@github.com:labbcb/docker-ga4gh-shiny.git
cd docker-ga4gh-shiny/
docker build -t welliton/ga4gh-shiny .
```

## Related images

- [Docker image for GA4GH reference server](https://github.com/labbcb/ga4gh-example/)
- [Docker image for GA4GH reference server with example data](https://github.com/labbcb/docker-ga4gh-example/)
- [Docker image for GA4GH reference server with 1000 Genomes Project data](https://github.com/labbcb/docker-ga4gh-1kgenomes/)
- [Docker image for GA4GH Beacon server](https://github.com/labbcb/docker-ga4gh-beacon)
