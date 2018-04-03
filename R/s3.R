# devtools::install_github("cloudyr/aws.signature")
# devtools::install_github("cloudyr/aws.s3")
aws.signature::use_credentials(profile = "tj")

library(aws.s3)

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
