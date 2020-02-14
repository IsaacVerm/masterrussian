add_russian_word_length <- function(words) {
  words %>%
    dplyr::mutate(russian_word_length = stringr::str_length(russian) - 1)
}
