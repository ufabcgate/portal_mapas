
library(foreign)
library(dplyr)
library(rgdal)
library(ggplot2)
library(shiny)
library(terra)
library(mapdeck)
library(sf)


token <- "pk.eyJ1IjoiZGllZ29idDg2IiwiYSI6ImNrbGF4dTExeDNqM2wydnVpbHk4MGRwMzIifQ.gyP4U6flwmGonS_ovkZkKw"
set_token(token = token)

shp <- read_sf("Cum_acc_2017_v2.shp")

shp$ACC_EMP_PT <- as.numeric(shp$ACC_EMP_PT)
shp$ACC_EMP_PR <- as.numeric(shp$ACC_EMP_PR)

shp$ACC_EDU_PT <- as.numeric(shp$ACC_EDU_PT)
shp$ACC_EDU_PR <- as.numeric(shp$ACC_EDU_PR)

shp$ACC_SAU_PT <- as.numeric(shp$ACC_SAU_PT)
shp$ACC_SAU_PR <- as.numeric(shp$ACC_SAU_PR)


server <- function(input, output, session) {
  
  output$plot <- renderMapdeck({
    mapdeck(style = mapdeck_style("light")) %>%
      mapdeck_view(
        location = c(-46.63,-23.55),
        zoom = 10
      )
    }
    )
  
  toListen <- reactive({
    list(input$oportunidade,input$modo)
  })
  observeEvent(toListen(), {
    if(input$oportunidade == "Emprego" && input$modo == "Transporte Publico"){
      mapdeck_update(map_id="plot") %>%
          add_polygon(
            layer_id = "grid",
            data = shp,
            fill_colour = "ACC_EMP_PT",
            fill_opacity = 0.5,
            stroke_opacity = 1,
            tooltip = "ACC_EMP_PT",
            legend = list(
              fill_colour = TRUE,
              stroke_colour = FALSE
            ),
            legend_options = list(
              fill_colour = list(title = "")
            ),
            update_view = FALSE,
            auto_highlight = TRUE
          )
      }
      #)
    #}
    else if (input$oportunidade == "Emprego" & input$modo == "Transporte Privado") {
      mapdeck_update(map_id="plot") %>%
        add_polygon(
          layer_id = "grid",
          data = shp,
          fill_colour = "ACC_EMP_PR",
          fill_opacity = 0.5,
          stroke_opacity = 1,
          tooltip = "ACC_EMP_PR",
          legend = list(
            fill_colour = TRUE,
            stroke_colour = FALSE
          ),
          legend_options = list(
            fill_colour = list(title = "")
          ),
          update_view = FALSE,
          auto_highlight = TRUE
          )
    }
    else if (input$oportunidade == "Saude" & input$modo == "Transporte Publico") {
      mapdeck_update(map_id="plot") %>%
        add_polygon(
          layer_id = "grid",
          data = shp,
          fill_colour = "ACC_SAU_PT",
          fill_opacity = 0.5,
          stroke_opacity = 1,
          tooltip = "ACC_SAU_PT",
          legend = list(
            fill_colour = TRUE,
            stroke_colour = FALSE
          ),
          legend_options = list(
            fill_colour = list(title = "")
          ),
          update_view = FALSE,
          auto_highlight = TRUE
        )
    }
    else if (input$oportunidade == "Saude" & input$modo == "Transporte Privado") {
      mapdeck_update(map_id="plot") %>%
        add_polygon(
          layer_id = "grid",
          data = shp,
          fill_colour = "ACC_SAU_PR",
          fill_opacity = 0.5,
          stroke_opacity = 1,
          tooltip = "ACC_SAU_PR",
          legend = list(
            fill_colour = TRUE,
            stroke_colour = FALSE
          ),
          legend_options = list(
            fill_colour = list(title = "")
          ),
          update_view = FALSE,
          auto_highlight = TRUE
        )
    }
    else if (input$oportunidade == "Educacao" & input$modo == "Transporte Publico") {
      mapdeck_update(map_id="plot") %>%
        add_polygon(
          layer_id = "grid",
          data = shp,
          fill_colour = "ACC_EDU_PT",
          fill_opacity = 0.5,
          stroke_opacity = 1,
          tooltip = "ACC_EDU_PT",
          legend = list(
            fill_colour = TRUE,
            stroke_colour = FALSE
          ),
          legend_options = list(
            fill_colour = list(title = "")
          ),
          update_view = FALSE,
          auto_highlight = TRUE
        )
    }
    else if (input$oportunidade == "Educacao" & input$modo == "Transporte Privado") {
      mapdeck_update(map_id="plot") %>%
        add_polygon(
          layer_id = "grid",
          data = shp,
          fill_colour = "ACC_EDU_PR",
          fill_opacity = 0.5,
          stroke_opacity = 1,
          tooltip = "ACC_EDU_PR",
          legend = list(
            fill_colour = TRUE,
            stroke_colour = FALSE
          ),
          legend_options = list(
            fill_colour = list(title = "")
          ),
          update_view = FALSE,
          auto_highlight = TRUE
        )
    }
  }
  )
}
  #}
   # )
    #}

