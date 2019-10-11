
#' compilePdfs
#'
#' @param targetDir 
#' @param context 
#'
#' @return
#' @export
#'
#' @examples
compilePdfs <- function(targetDir = "./tmp", context = "anal") {
  
  files <- file.info(list.files(targetDir, pattern = paste0("^", context),
                                full.names = TRUE))
  
  t <- character()
  
  for (file in rownames(files)) {
    t <- c(t, pdf_text(file))
  }
  
  t <- paste(t, collapse = ' ')
  # assume this apply for all...
  iconv(t, from = "latin1", to = "UTF-8")
}