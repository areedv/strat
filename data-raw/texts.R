## code to prepare `texts` dataset goes here

texts <- list()

texts$serv <- fetchPdfs(uris$serv, context = "serv")
texts$serv <- compilePdfs(context = "serv")

texts$anal <- fetchPdfs(uris$anal, context = "anal")
texts$anal <- compilePdfs(context = "anal")

usethis::use_data(texts, overwrite = TRUE)
