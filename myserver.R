
server <- function(input, output) {
  output$message <- renderText({
    msg <- paste0("You've chosen option #", input$radioInput,
           ". You've entered the following text: ", input$textInput)
    return(msg)
  })
}