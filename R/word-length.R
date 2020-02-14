add_russian_word_length <- function(words) {
  words %>%
    dplyr::mutate(russian_word_length = stringr::str_length(russian) - 1)
}

cum_word_length <- function(words, word_length) {
  words %>%
    dplyr::filter(russian_word_length <= word_length) %>%
    dplyr::pull(russian_word_length) %>%
    sum()
}

histogram_word_length <- function(words) {
  ggplot2::ggplot(data = words,
                  ggplot2::aes(x = russian_word_length)) +
    ggplot2::geom_histogram(binwidth = 1)
}
