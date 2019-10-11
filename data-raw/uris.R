## code to prepare `uris` dataset goes here

uris <- list()

# first 8 hits on https://www.kvalitetsregistre.no/article-categories/rapporter
uris$serv<-c("https://www.kvalitetsregistre.no/sites/default/files/dekningsgrad_og_resultater_med.kval_.reg_._2017.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/arsrapport_nsm_2018.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/statusrapport_ferdig.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/dekningsgrad_resultater_nmk_2016_final.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/arsrapport_2017_nsmk.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/ekspertgruppens_vurdering_av_arsrapporter_2016_endelig.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/statusrapport_2017.pdf",
        "https://www.kvalitetsregistre.no/sites/default/files/tilslutning_2017_171121_1.pdf")
# first 8 hits on https://helse-nord.no/skde/publikasjoner-og-artikler-fra-skde (including only norwegian texts)
uris$anal<-c("https://helseatlas.no/sites/default/files/helseatlas-gynekologi.pdf",
        "https://helseatlas.no/sites/default/files/helseatlas-fodselshjelp.pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Forbruk%20og%20pasientstr%C3%B8mmer%20ved%20akutte%20innleggelser%20-%20%20UNN%20HF%20og%20Finnmarkssykehuset%20HF%20(SKDE%202019).pdf",
        "https://helseatlas.no/sites/default/files/dagkirurgi_2013-2017.pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Aktivitet%20i%20spesialisthelsetjenesten%202012-2016_Nordlandssykehuset%20(SKDE2018).pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Ortopedi%20i%20Helse%20Nord%202012-2016%20(SKDE%202018).pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Fedmekirurgi,%20volum%20og%20metode%202012-2016%20(SKDE%202018).pdf",
        "https://helse-nord.no/Documents/SKDE/SKDE%20Notater/Avtalespesialister%20i%20Helse%20Nord%202014-2016%20(SKDE%202018).pdf")



usethis::use_data(uris, overwrite = TRUE)
