library(shiny)

shinyServer(
  function(input, output) {
    output$graph <- renderPlot({
      proper <- switch(input$property, 
                     "Conductivity" = chemFinal$Conductivity,
                     "Dissolved Oxygen (mg/L)" = chemFinal$DO..mg.L.,
                     "Dissolved Oxygen (%)" = chemFinal$DO....,
                     "pH" = chemFinal$pH, "skyblue",
                     "Turbidity (NTU)" = chemFinal$Turbidity..NTU.,
                     "Alkalinity (mg/L)" = chemFinal$Alkalinity..mg.L.
      )
      
      colored <- switch(input$property,
                        "Conductivity" = "orange",
                        "Dissolved Oxygen (mg/L)" = "green",
                        "Dissolved Oxygen (%)" = "darkgreen",
                        "pH" = "blue",
                        "Turbidity (NTU)" = "gray",
                        "Alkalinity (mg/L)" = "purple"
      )
      
      ggplot(chemFinal, aes(Location, proper)) + geom_bar(stat="identity", fill=colored) +
        xlab("Location") + ylab(input$property)
    })
  }
)