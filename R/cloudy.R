
#' html_to_text
#'
#' @param url
#'
#' @return
#' @export
#'
#' @examples
html_to_text<-function(url){

  # download html
  html.doc <- RCurl::getURL(url)
  #convert to plain text
  doc = XML::htmlParse(html.doc, asText=TRUE)
  # "//text()" returns all text outside of HTML tags.
  # We also don’t want text such as style and script codes
  text <- XML::xpathSApply(doc, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", XML::xmlValue)
  # Format text vector into one character string
  return(paste(text, collapse = " "))
}


#' makeWordCloud
#'
#' @param x
#' @param type
#' @param lang
#' @param excludeWords
#' @param textStemming
#' @param colorPalette
#' @param min.freq
#' @param max.words
#'
#' @return
#' @export
#'
#' @examples
makeWordCloud <- function(x, type=c("text", "url", "file"),
                          lang="norwegian", excludeWords=NULL,
                          textStemming=FALSE,  colorPalette="Dark2",
                          min.freq=3, max.words=200) {

  if(type[1]=="file") text <- readLines(x)
  else if(type[1]=="url") text <- html_to_text(x)
  else if(type[1]=="text") text <- x

  # Load the text as a tm::Corpus
  docs <- tm::Corpus(tm::VectorSource(text))
  # Convert the text to lower case
  docs <- tm::tm_map(docs, tm::content_transformer(tolower))
  # Remove numbers
  docs <- tm::tm_map(docs, tm::removeNumbers)
  # Remove stopwords for the language
  docs <- tm::tm_map(docs, tm::removeWords, tm::stopwords(lang))
  # Remove punctuations
  docs <- tm::tm_map(docs, tm::removePunctuation)
  # Eliminate extra white spaces
  docs <- tm::tm_map(docs, tm::stripWhitespace)
  # Remove your own stopwords
  if(!is.null(excludeWords))
    docs <- tm::tm_map(docs, tm::removeWords, tm::excludeWords)
  # Text stemming
  if(textStemming) docs <- tm::tm_map(docs, tm::stemDocument)
  # Create term-document matrix
  tdm <- tm::TermDocumentMatrix(docs)
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)
  # check the color palette name
  if(!colorPalette %in% rownames(RColorBrewer::brewer.pal.info)) colors = colorPalette
  else colors = RColorBrewer::brewer.pal(8, colorPalette)
  # Plot the word cloud
  set.seed(1234)
  wordcloud::wordcloud(d$word,d$freq, min.freq=min.freq, max.words=max.words,
            random.order=FALSE, rot.per=0.35,
            use.r.layout=FALSE, colors=colors)

  invisible(list(tdm=tdm, freqTable = d))
}
