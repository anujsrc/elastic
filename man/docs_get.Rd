% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docs_get.r
\name{docs_get}
\alias{docs_get}
\title{Get documents}
\usage{
docs_get(index, type, id, source = NULL, fields = NULL, exists = FALSE,
  raw = FALSE, callopts = list(), verbose = TRUE, ...)
}
\arguments{
\item{index}{(character) The name of the index. Required}

\item{type}{(character) The type of the document. Required}

\item{id}{(numeric/character) The document ID. Can be numeric or character.
Required}

\item{source}{(logical) If \code{TRUE}, return source.}

\item{fields}{Fields to return from the response object.}

\item{exists}{(logical) Only return a logical as to whether the document
exists or not.}

\item{raw}{If \code{TRUE} (default), data is parsed to list. If \code{FALSE}, then raw
JSON.}

\item{callopts}{Curl args passed on to \code{\link[httr:POST]{httr::POST()}}}

\item{verbose}{If TRUE (default) the url call used printed to console.}

\item{...}{Further args passed on to elastic search HTTP API as parameters.}
}
\description{
Get documents
}
\examples{
\dontrun{
docs_get(index='shakespeare', type='line', id=10)
docs_get(index='shakespeare', type='line', id=12)
docs_get(index='shakespeare', type='line', id=12, source=TRUE)

# Get certain fields
if (gsub("\\\\.", "", ping()$version$number) < 500) {
  ### ES < v5
  docs_get(index='shakespeare', type='line', id=10, fields='play_name')
  docs_get(index='shakespeare', type='line', id=10, 
    fields=c('play_name','speaker'))
} else {
  ### ES > v5
  docs_get(index='shakespeare', type='line', id=10, source='play_name')
  docs_get(index='shakespeare', type='line', id=10, 
    source=c('play_name','speaker'))
}

# Just test for existence of the document
docs_get(index='plos', type='article', id=1, exists=TRUE)
docs_get(index='plos', type='article', id=123456, exists=TRUE)
}
}
\references{
\url{https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-get.html}
}
