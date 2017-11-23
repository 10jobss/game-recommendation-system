library(shiny)
source("game_recommender.R")
game <- read.csv("D:/Data_Set/google_game_all.csv", header=T, stringsAsFactors = FALSE)
w_game <- read.csv("D:/Data_Set/weighted_google_game.csv", header=T, stringsAsFactors = FALSE)
p <- sample_generator()
v <- p$v # title of game
a <- p$a # index

shinyUI(pageWithSidebar(
  headerPanel("GooglePlay game recommender system"),
  sidebarPanel(
    titlePanel(
      h3("Choose what you like")
    ),
    
    radioButtons(inputId = "select1", label = v[1],
                 choices = c("Like" = a[1], "Dislike" = -a[1]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select2", label = v[2],
                 choices = c("Like" = a[2], "Dislike" = -a[2]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select3", label = v[3],
                 choices = c("Like" = a[3], "Dislike" = -a[3]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select4", label = v[4],
                 choices = c("Like" = a[4], "Dislike" = -a[4]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select5", label = v[5],
                 choices = c("Like" = a[5], "Dislike" = -a[5]), selected = character(0), inline = TRUE),
    actionButton("button", "Get Recommend")
  ),
  mainPanel(
    h3("Recommend lists for you"),
    tableOutput("table")
  )
))