if(! "proxy" %in% installed.packages()){install.packages("proxy")}
library(proxy)
if(!"recommenderlab" %in% installed.packages()){install.packages("recommenderlab")}
library(recommenderlab)
if(!"reshape" %in% installed.packages()){install.packages("reshape2")}
library(reshape2)

tab_recommendation <- function(input_instrument, input_difficulty, input_genre){
  tabs_subset <- subset(tabs_characteristics, 
                        genre == input_genre & 
                          difficulty == input_difficulty & 
                          instrument == input_instrument &
                          tabs_characteristics$tablatureID %in% prediction_vector)
  return(head(tabs_subset, n=10))
}