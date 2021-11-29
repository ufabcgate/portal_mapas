library(shiny)
library(shinyWidgets)
library(shiny.i18n)
library(leaflet)
library(mapdeck)


shinyUI(navbarPage("Resultados", id="nav",
                   
                   tabPanel("Mapa",
                            div(class="outer",
                                
                                tags$head(
                                  # Include our custom CSS
                                  includeCSS("styles.css")#,
                                  #includeScript("gomap.js")
                                ),
                                
                                mapdeckOutput("plot", width = "100%", height = "100%"),
  absolutePanel(
    id = "controls", class = "panel panel-default", 
    fixed = TRUE, draggable = FALSE,
    top = 155, right = 10, width = 350,
    h2("Acessibilidades na RMSP"),
    
  pickerInput(
    inputId = "oportunidade",
    label = "Escolha a oportunidade:",
    choices = list("Emprego", "Saude", "Educacao")),

  pickerInput(
    inputId = "modo",
    label = "Escolha o modo",
    choices = list("Transporte Publico", "Transporte Privado")
    
  ))))))
  
  