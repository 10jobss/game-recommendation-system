library(shiny)
source("game_recommender.R")
game <- read.csv("D:/Data_Set/google_game_all.csv", header=T, stringsAsFactors = FALSE)
w_game <- read.csv("D:/Data_Set/weighted_google_game.csv", header=T, stringsAsFactors = FALSE)

# genearte random number
# v - title, a - index (not rank)
p <- sample_generator()
v <- p$v
a <- p$a

shinyUI(pageWithSidebar(
  headerPanel("GooglePlay game recommender system"),
  sidebarPanel(
    titlePanel(
      h3("Choose what you like")
    ),
    # if user choose 'like' return index, or 'dislike' return -index
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
    radioButtons(inputId = "select6", label = v[6],
                 choices = c("Like" = a[6], "Dislike" = -a[6]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select7", label = v[7],
                 choices = c("Like" = a[7], "Dislike" = -a[7]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select8", label = v[8],
                 choices = c("Like" = a[8], "Dislike" = -a[8]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select9", label = v[9],
                 choices = c("Like" = a[9], "Dislike" = -a[9]), selected = character(0), inline = TRUE),
    radioButtons(inputId = "select10", label = v[10],
                 choices = c("Like" = a[10], "Dislike" = -a[10]), selected = character(0), inline = TRUE),
    actionButton("button", "Get Recommend")
  ),
  mainPanel(
    h3("Recommend lists for you"),
    tableOutput("table")
  )
))