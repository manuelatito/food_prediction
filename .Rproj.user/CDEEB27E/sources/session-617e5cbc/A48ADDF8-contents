function(input, output) {
  # me-load gambar yang di-upload oleh user
  image <- reactive({
    req(input$image_path)
    jpeg::readJPEG(input$image_path$datapath)
  })
  
  
  # membaca model
  model <- load_model_hdf5("finalmodel.h5")  
  
  # meng-convert image to array
  image_prep <- function(x) {
    arrays <- lapply(x, function(path) {
      img <- image_load(path, target_size = c(500,500), 
                        grayscale = F # Set FALSE if image is RGB
      )
      
      x <- image_to_array(img)
      x <- array_reshape(x, c(1, dim(x)))
      x <- x/255 # rescale image pixel
    })
    do.call(abind::abind, c(arrays, list(along = 1)))
  }
  
  # melakukan decode atas hasil prediksi sehingga yang keluar dari hasil prediksinya adalah nama makanan
  decode <- function(x){
    case_when(x == 0 ~ "asinan-jakarta",
              x == 1 ~ "ayam-betutu",
              x == 2 ~ "bika-ambon",
              x == 3 ~ "cendol",
              x == 4 ~ "gado-gado",
              x == 5 ~ "gudeg",
              x == 6 ~ "keladi",
              x == 7 ~ "klappertart",
              x == 8 ~ "kolak",
              x == 9 ~ "kue-lumpur",
              x == 10 ~ "nasi-goreng-kampung",
              x == 11 ~ "papeda",
              x == 12 ~ "rawon-surabaya",
              x == 13 ~ "rendang",
              x == 14 ~ "sate-ayam-madura",
              x == 15 ~ "soerabi",
              x == 16 ~ "soto-ayam-lamongan"
    )
  }
  
  # menampilkan gambar yang sudah di-upload oleh user
  output$imageupload <- renderPlot({
    validate(
      need(input$image_path, "No images have been uploaded yet"),
    )
    
    plot(as.raster(image()))
  })
  
  
  
  # mengeluarkan hasil prediksi gambar yang sudah di-upload oleh user
  output$prediction <- renderValueBox({
    validate(
      need(input$image_path, "Result"),
    )
    
    # menjalankan fungsi convert dengan data gambar yang di-upload oleh user
    img_test <- image_prep(input$image_path$datapath)
    
    # melakukan prediction untuk data yang di-upload user
    pred <- model %>% predict(img_test) %>% k_argmax()
    
    result <- sapply(pred, decode) 
    
    re <- info %>% filter(Makanan == result)
    alias <- re[,"Alias"]
    
    valueBox(value = alias, subtitle = "Prediction Result",
             color = "teal", 
             icon = icon("bowl-food"))
    
  })
  
  
  # mengeluarkan data course (jenis makanan) dari gambar yang sudah di-upload oleh user
  output$course <- renderValueBox({
    validate(
      need(input$image_path, "Result"),
    )
    
    # menjalankan fungsi convert dengan data gambar yang di-upload oleh user
    img_test <- image_prep(input$image_path$datapath)
    
    # melakukan prediction untuk data yang di-upload user
    pred <- model %>% predict(img_test) %>% k_argmax()
    
    result <- sapply(pred, decode) 
    
    re <- info %>% filter(Makanan == result)
    jenis <- re[,"Course"]
    
    valueBox(value = jenis, subtitle = "Course",
             color = "maroon", 
             icon = icon("cheese"))
  })
  
  # mengeluarkan data rasa dari gambar yang sudah di-upload oleh user
  output$tastes <- renderValueBox({
    validate(
      need(input$image_path, "Result"),
    )
    
    # menjalankan fungsi convert dengan data gambar yang di-upload oleh user
    img_test <- image_prep(input$image_path$datapath)
    
    # melakukan prediction untuk data yang di-upload user
    pred <- model %>% predict(img_test) %>% k_argmax()
    
    result <- sapply(pred, decode) 
    
    re <- info %>% filter(Makanan == result)
    rasa <- re[,"Tastes"]
    
    valueBox(value = rasa, subtitle = "Tastes",
             color = "teal", 
             icon = icon("face-grin-stars"))
  })
  
  # mengeluarkan data daerah asal dari gambar yang sudah di-upload oleh user
  output$origin <- renderValueBox({
    validate(
      need(input$image_path, "Result"),
    )
    
    # menjalankan fungsi convert dengan data gambar yang di-upload oleh user
    img_test <- image_prep(input$image_path$datapath)
    
    # melakukan prediction untuk data yang di-upload user
    pred <- model %>% predict(img_test) %>% k_argmax()
    
    result <- sapply(pred, decode) 
    
    re <- info %>% filter(Makanan == result)
    asal <- re[,"Kota"]
    
    valueBox(value = asal, subtitle = "Origin",
             color = "maroon", 
             icon = icon("city"))
  })
  
  
  output$alamat <- renderValueBox({
    
    info_r <- info %>% filter(info$Alias==input$input_name)
    
    infoBox(title = "restaurant info", value = info_r$Restaurant, subtitle = info_r$Alamat,
             color = "light-blue",
             icon = icon("utensils"))
    
  })
  
  
  output$leaflet <- renderLeaflet({
    
    info_r <- info %>% filter(info$Alias==input$input_name)
    
    maps_indonesia <- leaflet() %>% 
      addTiles() %>%
      setView( lat=info_r$Latitude_R, lng=info_r$Longitude_R , zoom=17) %>% 
      addPopups(lat=info_r$Latitude_R, lng=info_r$Longitude_R, info_r$Restaurant)
    
    maps_indonesia
  })
  
  output$data1 <- DT::renderDataTable(datadis_taste, options = list(paging = FALSE))
  
  output$data2 <- DT::renderDataTable(datadis_origin, options = list(paging = FALSE))
  
  output$data3 <- DT::renderDataTable(datadis_course, options = list(paging = FALSE))
  
  # me-load gambar riset_food
  output$personal_img <- renderImage({
    list(src = "tito.JPG",
         width = "200px",
         height = "200px")
    
  }, deleteFile = F)

  
}