# for Ubuntu, install curl [libcurl4-openssl-dev], v8 [libv8-dev], and
# maria db [libmariadbclient-dev]

install_github_packages <- function() {
  devtools::install_github("LearningToTalk/L2TDatabase")
  devtools::install_github("tjmahr/littlelisteners")
  devtools::install_github("tjmahr/lookr")
  devtools::install_github("tjmahr/tristan")
  devtools::install_github("klutometis/roxygen")
}
