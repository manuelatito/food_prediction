# Mempersiapkan Libraries
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(DT)
library(RColorBrewer)
library(bslib)

#library(reticulate)
library(rsconnect)
library(dplyr)
library(tidyverse)
library(imager)
library(keras)
library(tensorflow)
library(caret)

# Use python in your anaconda3 environment folder
#reticulate::use_python("C:/Users/hp/miniconda3/envs/tf_image", required = T)

# Membaca Data
info <- read.csv("food_info.csv")

# Data for display in table
datadis_taste <- info %>% 
  select(Tastes, Alias) %>% 
  rename("Food" = "Alias")

datadis_origin <- info %>% 
  select(Kota, Alias) %>% 
  rename("Food" = "Alias")

datadis_course <- info %>% 
  select(Course, Alias) %>% 
  rename("Food" = "Alias")

