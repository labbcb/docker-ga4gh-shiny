# Docker image for GA4GHshiny package

This Docker image provides the [GA4GHshiny Bioconductor package](https://bioconductor.org/packages/GA4GHshiny).
GA4GHshiny package provides an easy way to interact with data servers based on Global Alliance for Genomics and Health (GA4GH) genomics API through a Shiny application.
It also integrates with Beacon Network.
The web application runs on [Shiny Server](https://www.rstudio.com/products/shiny/shiny-server/) exposing the TCP port 3838.
By default, it connects to [Hosting Thousand Genomes Project](http://1kgenomes.ga4gh.org/).

To run this image, execute:

``` bash
docker container run --detach --name ga4gh-shiny --publish 3838:3838 --rm welliton/ga4gh-shiny
```

It will be available at <http://localhost:3838/>.
To stop container run.

``` bash
docker stop ga4gh-shiny
```

To change the default GA4GH server endpoint set environment variables:

- `HOST` URL of the GA4GH-based server entry point.
- `TXDB` Name of the TxDB package (should be none, `TxDb.Hsapiens.UCSC.hg19.knownGene` or `TxDb.Hsapiens.UCSC.hg38.knownGene`)
- `ORGDB` Name of the OrgDB package (should be none or `org.Hs.eg.db`)
- `SERVER_NAME` Name of the GA4GH server name (should be none or string).

``` bash
docker run --detach \
  --env HOST=http://1kgenomes.ga4gh.org/ \
  --env TXDB=TxDb.Hsapiens.UCSC.hg19.knownGene \
  --env ORGDB=org.Hs.eg.db \
  --env SERVER_NAME="Hosting Thousand Genomes Project" \
  --name ga4gh-shiny --publish 3838:3838 --rm welliton/ga4gh-shiny
```

## Buiding this image

``` bash
git clone git@github.com:labbcb/docker-ga4gh-shiny.git
cd docker-ga4gh-shiny/
docker build -t welliton/ga4gh-shiny .
```

## Related images

- [Docker image for GA4GH reference server](https://hub.docker.com/r/welliton/ga4gh-server/) ([GitHub](https://github.com/labbcb/docker-ga4gh-server/))
- [Docker image for GA4GH reference server with example data](https://hub.docker.com/r/welliton/ga4gh-example/) ([GitHub](https://github.com/labbcb/docker-ga4gh-example/))
- [Docker image for GA4GH reference server with 1000 Genomes Project data](https://github.com/labbcb/docker-ga4gh-1kgenomes/)
- [Docker image for GA4GH Beacon server](https://github.com/labbcb/docker-ga4gh-beacon)
