# Practica Shiny
library(shiny)
library(shinydashboard)
library(png)
library(shinythemes)
library(devtools)


# Cargamos el archivo que contiene la database y los ruidos
source("database.R")
source("noises.R")

# Creacion de muestra aleatoria para el numero a mostrar
a = sample(500, 1)

ui = dashboardPage(
  dashboardHeader(title = "Perceptual Experiment"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Play", tabName = "play", icon = icon("play")),
      menuItem("Design", tabName = "design"),
      menuItem("Results", tabName = "results")
    )
  ),
  
  dashboardBody(
    tabItems(
      # Tab donde vemos la imagen
      tabItem(tabName = "play",
              box(
                plotOutput("imagen") 
              ),
              box(
                numericInput("guess", "Guess the number", value = 0),
                actionButton("submit", label = "Play!"),
                verbatimTextOutput("success"),
                verbatimTextOutput("real_num")
                #actionButton("again", "Play again!"))
              )),# aqui viene la label del numero. Sera reactive porque no aparece hasta que introduce el numero
      
      # Tab donde elegimos los tipos de ruido
      tabItem(tabName = "design",
              box(title = "Types of noise", 
                  checkboxInput("white_noise", "White noise"),
                  conditionalPanel("input.white_noise == true",
                                   numericInput("white_p", 
                                                label = "Percentage",
                                                value = 0),
                                   selectInput("noises", label = "Noise", 
                                               choices = list("Normal noise", "Uniform noise", "Pure black"))),
                  checkboxInput("zeroing_noise", "Zeroing noise"),
                  conditionalPanel("input.zeroing_noise == true",
                                   numericInput("zeroing_p",
                                                label = "Percentage",
                                                value = 0)),
                  checkboxInput("vertical_lines", "Vertical lines"),
                  conditionalPanel("input.vertical_lines == true",
                                   numericInput("vertical_n",
                                                label = "How many?",
                                                value = 0))
              ),
              box(title = "Number of conditions")
      ),
      
      # Tab con la tabla donde aparecen los resultados numéricos
      tabItem(tabName = "results"#,
              #renderDataTable()
      )
    )
  )
)



server = server = function(input, output, session) {
  
  true_label = reactiveValues(number = NULL)
  yn = reactiveValues(x = NULL) # Reactive para el resultado del text "success"
  change = reactiveValues(pict = NULL)
  
  # Clickar en "Play!" produce:
  observeEvent(input$submit, {
    true_label$number = labels[[a]]
    output$real_num = renderText({ # Aparece el numero de la label
      paste0("The real number is ", true_label$number)
    })
    output$success = renderText({ # Compara el número introducido con el número de la label
      ifelse(input$guess == as.numeric(true_label$number), 
             "Correct! That's the number!", "Sorry, that's not the number!")
    })
  })
  
  #observeEvent(input$submit, {
    #a = sample(500, 1)
  #})
  
  
  
  output$imagen <- renderPlot({
    img <- imagenes[[a]]
    img = normalNoise(img)
    img = verticalLinesNoise(img)
    image(img, axes=FALSE)
  })
  
}


shinyApp(ui, server)












