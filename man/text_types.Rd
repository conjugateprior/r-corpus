\name{text_types}
\alias{text_ntype}
\alias{text_types}
\title{Text type sets.}
\description{
    Get or measure the set of types (unique token values).
}
\usage{
    text_types(x, filter = token_filter(), collapse = FALSE)

    text_ntype(x, filter = token_filter(), collapse = FALSE)
}
\arguments{
    \item{x}{a text or character vector.}

    \item{filter}{a token filter defining the token boundaries and
        normalization.}

    \item{collapse}{a logical value indicating whether to collapse the
        aggregation over all rows of the input.}
}
\details{
    \code{text_ntype} counts the number of unique types in each text;
    \code{text_types} returns the set of unique types, as a character
    vector. Types are determined according to the \code{filter} argument.
}
\value{
    If \code{collapse = FALSE}, then \code{text_ntype} produces a numeric
    vector with the same length and names as the input text, with the elements
    giving the number of units in the corresponding texts.  For
    \code{text_types}, the result is a list of character vector with each
    vector giving the unique types in the corresponding text.

    If \code{collapse = TRUE}, then we aggregate over all rows of the input.
    In this case, \code{text_ntype} produces a scalar indicating the number
    of unique types in \code{x}, and \code{text_types} produces a character
    vector with the unique types.
}
\seealso{
    \code{\link{token_filter}}, \code{\link{text_tokens}}.
}
\examples{
    text <- c("I saw Mr. Jones today.",
              "Split across\na line.",
              "What. Are. You. Doing????",
              "She asked 'do you really mean that?' and I said 'yes.'")

    # count the number of unique types
    text_ntype(text)
    text_ntype(text, collapse = TRUE)

    # get the type sets
    text_types(text)
    text_types(text, collapse = TRUE)
}
