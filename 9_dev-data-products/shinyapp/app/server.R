# Define server
function(input, output, session) {
  
  # Reactive dataset filtered by date
  movies_filtered <- reactive({
    req(input$date)
    movies %>%
      filter(thtr_rel_date >= as.POSIXct(input$date[1]) & 
             thtr_rel_date <= as.POSIXct(input$date[2]))
  })
  
  # Reactive value for toggling model line
  show_model <- reactiveVal(FALSE)
  
  # Toggle model line when button is clicked
  observeEvent(input$toggle_model, {
    show_model(!show_model())
  })
  
  # Model reactive for brushed data
  model <- reactive({
    brushed_data <- brushedPoints(movies_filtered(), input$plot_brush, xvar = input$x, yvar = input$y)
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    lm(reformulate(input$x, input$y), data = brushed_data)
  })
  
  output$scatterplot1 <- renderPlot({
    
    # create the if statement to us the correct plot with input x y z alpha and filtered by time range
    if (input$plot_type == "scatter") {
      movies_selected_date <- movies_filtered()
      ggplot(data = movies_selected_date, aes_string(x = input$x, y = input$y, color = input$z)) +
        geom_point(alpha = input$alpha)
      
    } else if (input$plot_type == "boxplot") {
      movies_selected_date <- movies_filtered()
      ggplot(data = movies_selected_date, aes_string(x = input$x, y = input$y, color = input$z)) +
        geom_boxplot(alpha = input$alpha)
      
    } else if (input$plot_type == "barplot") {
      movies_selected_date <- movies_filtered()
      ggplot(data = movies_selected_date, aes_string(x = input$x, fill = input$z)) +
        geom_bar(alpha = input$alpha)
    }
  })
  
  #LM model - now uses filtered data
  output$lmoutput <- renderPrint({
    movies_selected_date <- movies_filtered()
    x <- movies_selected_date %>% pull(input$x)
    y <- movies_selected_date %>% pull(input$y)
    print(summary(lm(y ~ x, data = movies_selected_date)), digits = 3, signif.stars = FALSE)
  })
  
  # print distribution of x variable
  output$densityplot <- renderPlot({
    movies_selected_date <- movies_filtered()
    ggplot(data = movies_selected_date, aes_string(x = input$x)) +
      geom_density()
  })
  
  output$moviestable1 <- renderDataTable({
    DT::datatable(movies)
  })
  
  output$moviestable2 <- renderDataTable({
    brushedPoints(movies_filtered(), input$plot_brush) %>%
      select(title, audience_score, critics_score)
  })
  
  output$scatterplot2 <- renderPlot({
    movies_selected_date <- movies_filtered()
    p <- ggplot(data = movies_selected_date, aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha)
    
    # Add regression line if model toggle is on and model exists
    if(show_model() && !is.null(model())) {
      brushed_data <- brushedPoints(movies_selected_date, input$plot_brush, xvar = input$x, yvar = input$y)
      if(nrow(brushed_data) >= 2) {
        p <- p + geom_smooth(data = brushed_data, method = "lm", se = TRUE, 
                            aes_string(x = input$x, y = input$y), 
                            color = "darkblue", inherit.aes = FALSE)
      }
    }
    
    p
  })
  
  # Model summary for brushed data
  output$brushed_model <- renderPrint({
    if(show_model() && !is.null(model())) {
      brushed_data <- brushedPoints(movies_filtered(), input$plot_brush, xvar = input$x, yvar = input$y)
      cat("🎯 INTERACTIVE REGRESSION ANALYSIS\n")
      cat("═══════════════════════════════════\n")
      cat("📊 Selected Points:", nrow(brushed_data), "movies\n")
      cat("📈 Variables:", paste(input$y, "~", input$x), "\n")
      cat("📅 Date Range:", format(input$date[1]), "to", format(input$date[2]), "\n\n")
      print(summary(model()), digits = 3, signif.stars = FALSE)
    } else if(show_model()) {
      cat("🚨 SELECTION NEEDED\n")
      cat("═══════════════════\n")
      cat("Please select at least 2 points by dragging\n")
      cat("on the plot above to create a regression model.\n\n")
      cat("💡 TIP: Click and drag to brush/select points!")
    } else {
      cat("🎯 INTERACTIVE ANALYSIS READY\n")
      cat("══════════════════════════════\n")
      cat("1️⃣ Click 'Toggle Regression Line' button\n")
      cat("2️⃣ Drag on the plot to select points\n")
      cat("3️⃣ View your custom regression analysis here!\n\n")
      cat("🔍 This will show a model based only on\n")
      cat("   the points you select on the plot.")
    }
  })
}
