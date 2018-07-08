# devtools::install_github("cloudyr/aws.signature")
# devtools::install_github("cloudyr/aws.s3")
aws.signature::use_credentials(profile = "tj")

library(aws.s3)

save_object_to_data <- function(file) {
  paths <- get_data_paths(file)
  save_object(paths$cloud, file = paths$local)
}

put_object_to_data <- function(file) {
  paths <- get_data_paths(file)
  put_object(paths$cloud, file = paths$local)
}

get_data_paths <- function(file) {
  list(
    local = file.path("./data", file),
    cloud = file.path("s3://bunnyhat/data", file)
  )
}


download_aim1_eyetracking_data <- function() {
  save_object(
    "s3://bunnyhat/data/aim1-screened.csv.gz",
    file = "./data/aim1-screened.csv.gz")

  save_object(
    "s3://bunnyhat/data/aim1-model-ready.csv.gz",
    file = "./data/aim1-model-ready.csv.gz")
}

download_aim1_stan_data <- function() {
  save_object(
    "s3://bunnyhat/data/stan_aim1_cubic_model.rds.gz",
    file = "./data/stan_aim1_cubic_model.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-gca-features.csv.gz",
    file = "./data/aim1-gca-features.csv.gz")
}

download_aim1_gamm_data <- function() {
  save_object(
    "s3://bunnyhat/data/aim1-semy-random-smooths.rds.gz",
    file = "./data/aim1-semy-random-smooths.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-phon-random-smooths.rds.gz",
    file = "./data/aim1-phon-random-smooths.rds.gz")


  save_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-base.rds.gz",
    file = "./data/aim1-phon-gamm-age3-base.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-ppvt.rds.gz",
    file = "./data/aim1-phon-gamm-age3-ppvt.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-minp.rds.gz",
    file = "./data/aim1-phon-gamm-age3-minp.rds.gz")


  save_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-base.rds.gz",
    file = "./data/aim1-semy-gamm-age3-base.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-ppvt.rds.gz",
    file = "./data/aim1-semy-gamm-age3-ppvt.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-minp.rds.gz",
    file = "./data/aim1-semy-gamm-age3-minp.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-ppvt-para.rds.gz",
    file = "./data/aim1-semy-gamm-age3-ppvt-para.rds.gz")

  save_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-minp-para.rds.gz",
    file = "./data/aim1-semy-gamm-age3-minp-para.rds.gz")
}


upload_aim1_gamm_data <- function() {
  put_object(
    "s3://bunnyhat/data/aim1-semy-random-smooths.rds.gz",
    file = "./data/aim1-semy-random-smooths.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-phon-random-smooths.rds.gz",
    file = "./data/aim1-phon-random-smooths.rds.gz")


  put_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-base.rds.gz",
    file = "./data/aim1-phon-gamm-age3-base.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-ppvt.rds.gz",
    file = "./data/aim1-phon-gamm-age3-ppvt.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-ppvt-para.rds.gz",
    file = "./data/aim1-phon-gamm-age3-ppvt-para.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-phon-gamm-age3-minp.rds.gz",
    file = "./data/aim1-phon-gamm-age3-minp.rds.gz")


  put_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-base.rds.gz",
    file = "./data/aim1-semy-gamm-age3-base.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-ppvt.rds.gz",
    file = "./data/aim1-semy-gamm-age3-ppvt.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-minp.rds.gz",
    file = "./data/aim1-semy-gamm-age3-minp.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-ppvt-para.rds.gz",
    file = "./data/aim1-semy-gamm-age3-ppvt-para.rds.gz")

  put_object(
    "s3://bunnyhat/data/aim1-semy-gamm-age3-minp-para.rds.gz",
    file = "./data/aim1-semy-gamm-age3-minp-para.rds.gz")
}



download_lkj_demo_data <- function() {
  save_object(
    "s3://bunnyhat/data/aim1-lkj-prior-demo.csv.gz",
    file = "./data/aim1-lkj-prior-demo.csv.gz")
}

upload_lkj_demo_data <- function() {
  put_object(
    "s3://bunnyhat/data/aim1-lkj-prior-demo.csv.gz",
    file = "./data/aim1-lkj-prior-demo.csv.gz")
}



upload_aim2_real_nonword_data <- function() {
  put_object_to_data("aim2-model-ready.csv.gz")
  put_object_to_data("aim2-real-vs-nw-modeled-data.rds.gz")
}

download_aim2_real_nonword_data <- function() {
  save_object_to_data("aim2-model-ready.csv.gz")
  save_object_to_data("aim2-real-vs-nw-modeled-data.rds.gz")
}

upload_aim2_real_nonword_models <- function() {
  put_object_to_data("aim2-real-vs-nw-tp1.rds.gz")
  put_object_to_data("aim2-real-vs-nw-tp2.rds.gz")
  put_object_to_data("aim2-real-vs-nw-tp3.rds.gz")
  put_object_to_data("aim2-real-vs-nw-all-peaks.rds.gz")
  put_object_to_data("aim2-real-vs-nw-tp1-averages.rds.gz")
  put_object_to_data("aim2-real-vs-nw-tp2-averages.rds.gz")
  put_object_to_data("aim2-real-vs-nw-tp3-averages.rds.gz")
}

download_aim2_real_nonword_models <- function() {
  save_object_to_data("aim2-real-vs-nw-tp1.rds.gz")
  save_object_to_data("aim2-real-vs-nw-tp2.rds.gz")
  save_object_to_data("aim2-real-vs-nw-tp3.rds.gz")
  save_object_to_data("aim2-real-vs-nw-all-peaks.rds.gz")
  save_object_to_data("aim2-real-vs-nw-tp1-averages.rds.gz")
  save_object_to_data("aim2-real-vs-nw-tp2-averages.rds.gz")
  save_object_to_data("aim2-real-vs-nw-tp3-averages.rds.gz")
}

upload_aim2_mp_models <- function() {
  put_object_to_data("aim2-mp-fam.rds.gz")
  put_object_to_data("aim2-mp-unfam.rds.gz")
  put_object_to_data("aim2-mp-fam-peaks.csv.gz")
  put_object_to_data("aim2-mp-unfam-peaks.csv.gz")
}

download_aim2_mp_models <- function() {
  save_object_to_data("aim2-mp-fam.rds.gz")
  save_object_to_data("aim2-mp-unfam.rds.gz")
  put_object_to_data("aim2-mp-fam-peaks.csv.gz")
  put_object_to_data("aim2-mp-unfam-peaks.csv.gz")
}
