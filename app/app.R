library(shiny)
library(shinyWidgets)
library(shiny.i18n)
library(leaflet)
library(mapdeck)
library(deckgl)

source("ui.r")
source("server.r")


token <- "pk.eyJ1IjoiZGllZ29idDg2IiwiYSI6ImNrbGF4dTExeDNqM2wydnVpbHk4MGRwMzIifQ.gyP4U6flwmGonS_ovkZkKw"
set_token(token = token)

shinyApp(ui = ui,server = server)



#rsconnect::setAccountInfo(name='diegobt86',
 #                         token='5003A4E0497A262ADB4A62AA70ADF583',
  #                        secret='w1mMRay+n9dcwnVo3+I0bA1RKjuBDIskOP1jg+ck')

#rsconnect::deployApp('c:/Acesso_Livre/shiny_app')