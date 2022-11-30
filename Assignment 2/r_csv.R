#Scraping data from Wikipedia
library(rvest)
wiki_url <- "https://en.wikipedia.org/wiki/Comma-separated_values#Example"
html <- read_html(wiki_url)
cardf <-html_node(html,".wikitable") %>% 
  html_table() %>% 
  head()

#Export file in csv format
write.csv(cardf,"Path to export the DataFrame\\cardf.csv", row.names = TRUE

          