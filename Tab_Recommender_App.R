if(!"shiny" %in% installed.packages()){install.packages("shiny")}
library(shiny)
if(! "proxy" %in% installed.packages()){install.packages("proxy")}
library(proxy)
if(!"recommenderlab" %in% installed.packages()){install.packages("recommenderlab")}
library(recommenderlab)
if(!"reshape" %in% installed.packages()){install.packages("reshape2")}
library(reshape2)
source("helpercode.R")

genres <- c("Pop/Rock", "Blues/Jazz", "Reggae", "Metal")
DifficultyLevel <- c("Easy","Middle", "Hard")
Instrument <- c("Acoustic_Guitar", "Electric_Guitar", "Bass_Guitar")
Tonality <- c("DO+","DOm", "RE+", "REm", "MI+", "MIm", "FA+", "FAm", "SOL+", "SOLm", "LA+", "LAm", "SI+", "SIm" )


ui <- fluidPage(
  titlePanel("Music Professor Tablature Recommendation System"),
  fluidRow(
    column(4, h3("Select the tab characteristics:"),
           wellPanel(
             selectInput("input_instrument", "Instrument", Instrument),
             selectInput("input_difficultyLevel", "Difficulty Level", DifficultyLevel),
             selectInput("input_genre", "Genre", genres)
           )
    ),
    column(6, h3("You Might Like the Following Tablatures!"), tableOutput("table"))
    #img(src='guitar.jpg', width = 68)
  )
)

server <- function(input, output){

  output$table <- renderTable({
    tab_recommendation(input_instrument = input$input_instrument, 
                       input_difficulty = input$input_difficultyLevel,
                       input_genre = input$input_genre)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
