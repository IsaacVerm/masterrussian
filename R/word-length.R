add_russian_word_length <- function(words) {
  words %>%
    dplyr::mutate(russian_word_length = stringr::str_length(russian) - 1)
}

filter_by_word_length <- function(words, max_word_length) {
  words %>%
    dplyr::filter(russian_word_length <= max_word_length)
}

randomize_word_order <- function(words) {
  words %>%
    dplyr::sample_frac()
}

write_word_length_group <- function(words) {
  words %>%
    dplyr::group_by(russian_word_length) %>%
    dplyr::group_walk(~ readr::write_csv(.x, paste0("words_", .y$russian_word_length, ".csv")))
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
