
ui <- fluidPage(
  h1("Demo Page"),
  p(
    "this is a paragraph with",
    strong("bold"),
    "text."
    ),
  h2("here are some example inputs"),
  radioButtons(
    inputId = "radioInput",
    label = h3("Demo radio buttons"),
    choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
    selected = 1
  ),
  textInput(
    inputId = "textInput",
    label = h3("example text input"),
    placeholder = "enter your text here"
  ),
  textOutput(
    outputId = "message")
)