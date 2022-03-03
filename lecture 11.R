install.packages("readxl")
library(readxl)
install.packages("googlesheets4")
library(googlesheets4)

lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

write_csv(lotr, file = "data/lotr.csv")

lotr_disk <- read_csv("data/lotr.csv",skip=1)
lotr_disk <- read_csv("data/lotr.csv",comment="#",col_names = FALSE)
lotr_disk <- read_csv("data/lotr.csv",comment="#", na=c("NA", "xx"))
lotr_disk <- read_csv("data/lotr.csv")

problems(lotr_disk)

lotr_xl <- read_xlsx("LOTR.xlsx",sheet =2)
lotr_xl <- read_xlsx("LOTR.xlsx",sheet ="FOTR")

gs4_deauth()
lotr_gs <- read_sheet("https://docs.google.com/spreadsheets/d/1X98JobRtA3JGBFacs_JSjiX-4DPQ0vZYtNl_ozqF6IE/edit#gid=754443596")

lotr_disk <- read_csv("data/lotr.csv",comment = "#", na=c("NA", "xx"))
col_types = cols(Words=col_integer())## change whole column into int
lotr_disk%>%
  mutate(Words = parse_integer(Words))

lotr_disk <- read_csv("data/lotr.csv",comment="#", na=c("NA"))

parse_double("1.23")


