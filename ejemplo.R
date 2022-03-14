library(shiny)
library(shinythemes)

# ui: funciones R anidadas que ensamblan una interfaz de usuario HTML para su aplicación

ui <- fluidPage(
  
  # el tema, añade estilo en cuanto a color, tamaño y tipo de letra
  # los temas libres son: cerulean, cosmo, cyborg, darkly, flatly, journal, lumen, paper,
  # readable, sandstone, simplex, slate, spacelab, superhero, united, yeti
  
  theme = shinytheme("united"),
  
  # App titulo ---
  titlePanel("Título de la aplicación"),
  
  # Diseño de barra lateral con definiciones de entrada y salida ----
  
  #sidebarLayout(
    
    # Panel de barra lateral para entradas ----
    #sidebarPanel(
      
      # Entrada: control deslizante para el número de barras ----
      h2('Panel fluido'),
      
      img(src="see.jpeg", align = "center",height = 200, width = 200),
      hr(),
      
      #sliderInput es un widg
      sliderInput("barra",
                  "Numbero de barras:",
                  min = 1,
                  max = 100,
                  value = 10),
      strong("laura la más linda"),
    #),
    
    # Panel principal para mostrar las salidas o resultados ----
    #mainPanel(
      
      #h2('Panel principal'),
      
      # linea separadora
      hr(),
      
      plotOutput("grafico"),
  
      strong("Esta es la última línea.")
    #)
  #)
)

# Definir en el server el codigo necesario para dibujar un histograma ----

server <- function(input, output,session) {
  
  
  # Histograma de The Old Faithful Geyser Data ----
  # con el numero solicitado de barras
  # renderizar o reproducir cierto tipo de resultado: una tabla, un gráfico o texto y
  # guardarlo en una variable de salida
  #
  # 1. Es "reactivo" y, por lo tanto, debe volver a ejecutarse automáticamente cuando las entradas (entrada$barras) cambian
  # 2. Su tipo de salida o resultado es un diagrama; es decir, un grafico
  # 3. Las variables entre elementos render no se comunican o no se mezclan
  
  
  output$grafico <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$barra + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Tiempo de espera hasta la próxima erupción (en minutos)",
         main = "Histograma de los tiempos de espera")
    
  })
  
  
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)