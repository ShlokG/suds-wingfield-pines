library(shiny)

shinyUI(fluidPage(
  titlePanel("Wingfield Pines"),
  sidebarLayout(
    sidebarPanel(
      helpText("Find out how Wingfield Pines improves the water as it passes through its treatment system."),
      
      selectInput("property", 
                  label="Choose a property of the water",
                  choices = c("Conductivity", "Dissolved Oxygen (mg/L)",
                              "Dissolved Oxygen (%)", "pH",
                              "Turbidity (NTU)", "Alkalinity (mg/L)"),
                  selected = "Conductivity")),
    mainPanel(plotOutput("graph"))
    
  )
)
)
