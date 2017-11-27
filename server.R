library(shiny)
source("game_recommender.R")
shinyServer(function(input, output) {
   observeEvent(input$button, {
    output$table <- renderTable({
      game_recommender(input$select1, input$select2, input$select3, input$select4, input$select5
                       ,input$select6,input$select7,input$select8,input$select9,input$select10)})
   })
})