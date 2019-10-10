## code to prepare `DATASET` dataset goes here

uris <- list()

uris$serv<-c("https://www.kvalitetsregistre.no/sites/default/files/dekningsgrad_og_resultater_med.kval_.reg_._2017.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/arsrapport_nsm_2018.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/statusrapport_ferdig.pdf")
uris$anal<-c("https://helseatlas.no/sites/default/files/helseatlas-gynekologi.pdf",
        "https://helseatlas.no/sites/default/files/helseatlas-fodselshjelp.pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Forbruk%20og%20pasientstr%C3%B8mmer%20ved%20akutte%20innleggelser%20-%20%20UNN%20HF%20og%20Finnmarkssykehuset%20HF%20(SKDE%202019).pdf")



usethis::use_data(uris)
