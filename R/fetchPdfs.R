
#' fetchPdfs
#'
#' @param uris 
#' @param context 
#' @param targetDir 
#'
#' @return
#' @export
#'
#' @examples
fetchPdfs <- function(uris, context = "anal", targetDir = "./tmp") {
  
  if (!dir.exists(targetDir)) {
    dir.create(targetDir)
  }
  
  for (u in uris) {
    download.file(u,
                  file.path(targetDir, paste0(context, "_", basename(u))),
                  mode = "wb")
  }
}