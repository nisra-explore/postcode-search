
library(dplyr)
library(readr)

cpd_latest <- read.csv("CPD_LIGHT_Jan26.csv", stringsAsFactors = FALSE)
str(cpd_latest)

# remove blank, invalid (999999) and incorrect (666666) entries
filtered_cpd <- cpd_latest |> 
  filter(PC5 != "" &
           PC5 != "0000000" &
           X != 0 &
           X != 999999 &
           Y != 999999 &
           X != 666666 &
           Y != 666666)

write.csv(filtered_cpd, file = "CPD_LIGHT.csv", row.names = FALSE, quote = FALSE)
