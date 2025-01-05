# Skin Page
dashboardPage(skin = "green",
              
    # Header
    dashboardHeader(title = "Food Classification"),
    
    # Sidebar
    dashboardSidebar(
      sidebarMenu(
        menuItem(
          text = "Overview",
          tabName = "overview",
          icon = icon("earth-asia")
        ),
        menuItem(
          text = "Prediction",
          tabName = "prediction",
          icon = icon("bowl-food")
        ),
        menuItem(
          text = "Reference",
          tabName = "reference",
          icon = icon("magnifying-glass")
        ),
        menuItem(
          text = "Maps",
          tabName = "maps",
          icon = icon("location-dot")
        ),
        menuItem(
          text = "About Me",
          tabName = "about_me",
          icon = icon("address-card")
        )
      )
    ),
    
    # Dashboard
    dashboardBody(
      tabItems(
        
        # Tab 1 untuk halaman overview
        tabItem(
          tabName = "overview",
            carousel(
              id = "mycarousel",
              width = 12,
              carouselItem(
                caption = " ",
                tags$img(src = "classification-using-AI.png")
              ),
              carouselItem(
                caption = " ",
                tags$img(src = "guess-the-food.png")
              ),
              carouselItem(
                caption = " ",
                tags$img(src = "research-result.png")
              ),
              carouselItem(
                caption = " ",
                tags$img(src = "food-classes.png")
              ),
              carouselItem(
                caption = " ",
                tags$img(src = "features.png")
            )
          )
          
          
        #akhir tab 1  
       ),
       
        
        # Tab 2 untuk halaman Prediction
        tabItem(
          tabName = "prediction",
          
          # fluidRow untuk mengatur infoBox()
          fluidRow(
            infoBox(
              title = "Total Food Types", # menampilkan judul pada infobox
              value = length(unique(info$Makanan)), # menampilkan nilai pada infobox
              width = 4, # mengatur ukuran pada infobox
              color = "yellow", # mengatur warna pada infobox
              icon = icon("bowl-rice") # memberikan icon pada infobox
            ),
            infoBox(
              title = "Total Origin", # menampilkan judul pada infobox
              value = length(unique(info$Kota)), # menampilkan nilai pada infobox
              width = 4, # mengatur ukuran pada infobox
              color = "yellow", # mengatur warna pada infobox
              icon = icon("mountain-city") # memberikan icon pada infobox
            ),
            infoBox(
              title = "Model Accuracy", # menampilkan judul pada infobox
              value = "90%", # menampilkan nilai pada infobox
              width = 4, # mengatur ukuran pada infobox
              color = "yellow", # mengatur warna pada infobox
              icon = icon("bullseye") # memberikan icon pada infobox
           )
          ),
          
         
          fluidRow(
            box(width = 6,
                fileInput(inputId = "image_path", label = h3("Upload an Image to Predict")), 
                
                plotOutput(outputId = "imageupload")
            ),
            valueBoxOutput(outputId = "prediction", width = 6),
            valueBoxOutput(outputId = "course", width = 6),
            valueBoxOutput(outputId = "tastes", width = 6),
            valueBoxOutput(outputId = "origin", width = 6)
          )
          
          #akhir tab 2
        ),
       
       # Tab 3 untuk halaman Reference
       tabItem(
         tabName = "reference",
         fluidPage(
           h1(tags$b("Food by Categories"))
         ),
         
            fluidRow(
              box(width = 12,
                navset_pill_list(
              
                 # Panel Tastes ----
                 nav_panel("Tastes", h2(tags$b("Traditional Food by Tastes")),
                           DT::dataTableOutput("data1")),
                
                 # Panel Origin ----
                 nav_panel("Origin", h2(tags$b("Traditional Food by Origin")),
                           DT::dataTableOutput("data2")),
                 
                 # Panel Course ----
                 nav_panel("Course", h2(tags$b("Traditional Food by Course")),
                           DT::dataTableOutput("data3"))
              
                )
              )
            )
           
         
       ),
         
      
       #akhir tab 3
       
       
        # Tab 4 untuk halaman maps
        tabItem(
          tabName = "maps",
          fluidRow(
            infoBoxOutput(outputId = "alamat", width = 8),
            box(width = 4,
                selectInput(inputId = "input_name",
                            choices = unique(info$Alias),
                            label = "SEARCH YOUR FOOD!")
            )
          ),
          box(width = 12,
              solidHeader = T,
              h3(tags$b("Restaurant Location")),
              leafletOutput("leaflet", height = 510)
              )
          ),
       
          #akhir tab 4
        
      
        # Tab 5 untuk halaman About Me
        tabItem(
          tabName = "about_me",
          fluidPage(
            h1(tags$b("My Personal Info"))
          ),
            
            fluidRow(
              box(width = 3, status = "primary",
                img(src= "tito.JPG",
                    align = "center", style = "width: 80%; height: 80%; display: block; margin-left: auto; margin-right: auto;")),
              box(width = 9, status = "primary",
                  tags$h2("Hey there! I am Tito Krisnawati"), br(), tags$p("I am very passionate about data science. My experience in billing, finance, and leading teams has made me adaptable and detail-oriented. I’m excited to bring my skills into a data-driven role where I can continue to learn, grow, and contribute to meaningful projects."),
                  br(),
                  tags$h2("My Contact"), br(),
                  tags$ol(
                    tags$li(tags$a(href="https://www.linkedin.com/in/tito-krisnawati/", "Linkedin")),
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/", "RPubs")),
                    tags$li(tags$a(href="https://github.com/manuelatito", "GitHub"))
                  ), br(),
                  tags$h2("My Portofolio"), br(),
                  tags$ol(
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/pollution_analysis", "Air Pollution Analysis in Seoul")),
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/crime_analysis", "Crime Rate Analysis with Linear Regression Model")),
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/wholesale_analysis", "Wholesale Analysis with Classification Model")),
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/marketing_prediction", "Bank Marketing Prediction with Classification Model")),
                    tags$li(tags$a(href="https://rpubs.com/manuelatito/offense_analysis", "Time Series Analysis of Offense Data Involving Children in Chicago")),
                    tags$li(tags$a(href="https://manuelatito.shinyapps.io/shiny_lbb_ip/", "Analisis Nutrisi Menu pada Restoran Fast Food di Amerika Serikat")),
                    tags$li(tags$a(href="https://manuelatito.shinyapps.io/shiny_capstone_dv/", "Airbnb di Seattle, Washington, United States"))
                  )
                  )
            )
          )
        #akhir tab 5
      )
    )
)     

   
  
     


