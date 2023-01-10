library(rvest)

url <- read_html("https://www.alexa.com/topsites/countries/IN")
webpage <- read_html(url)

header <- html_nodes(webpage, "h1")
header_text <- html_text(header)

urls <- html_nodes(webpage, "a") %>% html_attr("href")
images <- html_nodes(webpage, "img") %>% html_attr("src")

print(header_text)