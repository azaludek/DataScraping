library(rvest)
library(dplyr)

link <- "https://editorial.rottentomatoes.com/guide/100-best-classic-movies"
page <- read_html(link)

name <- page %>% html_nodes(".article_movie_title a") %>% html_text()
rating <- page %>% html_nodes(".tMeterScore") %>% html_text()
synopsis <- page %>% html_nodes(".synopsis") %>% html_text()

movies <- cbind(name,rating)
movies <- data.frame(name, rating, synopsis, stringsAsFactors = FALSE)

write.csv(movies, "movies.csv")