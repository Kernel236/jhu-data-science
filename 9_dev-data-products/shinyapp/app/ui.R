# UI Definition
# Note: Libraries and data loading are now in global.R


# Define UI

page_sidebar(theme = bs_theme(preset = "united"),
  sidebar = sidebar(
    # Display number of observations
    div(class = "alert alert-info",
        HTML(paste0("<strong>🎬 Movies Dataset</strong><br>", 
                   nrow(movies), " movies with ratings, genres, and release information."))),
    
    
    div(class = "alert alert-light", style = "font-size: 0.85em;",
        HTML("<strong>📋 How to use:</strong><br>
             1️⃣ Configure plot settings above<br>
             2️⃣ Go to <strong>Plot2</strong> tab<br>
             3️⃣ <strong>Drag</strong> to select points on the plot<br>
             4️⃣ Click <strong>Toggle Regression Line</strong><br>
             5️⃣ View model details in the summary panel")),
    
    h5("📊 Plot Configuration"),
    
    # select type of plot with a select input scatter barplot and boxplot 
    selectInput(
      inputId = "plot_type",
      label = "Select plot type:",
      choices = c("Scatterplot" = "scatter", "Boxplot" = "boxplot", "Barplot" = "barplot"),
      selected = "scatter"
    ) %>% 
      bslib::tooltip("Choose the type of visualization for your data analysis"),
    
    selectInput(
      inputId = "y",
      label = "Y-axis (Dependent Variable):",
      choices = numeric_names,
      selected = numeric_names[1]
    ),
    
    selectInput(
      inputId = "x",
      label = "X-axis (Independent Variable):",
      choices = numeric_names,
      selected = numeric_names[2]
    ),
    
    selectInput(
      inputId = "z",
      label = "Group by (Color/Fill):",
      choices = factor_names,
      selected = factor_names[1]
    ) %>% 
      bslib::tooltip("Categorical variable used for coloring points or grouping data"),
    
    sliderInput(inputId = "alpha",
                label = "Transparency (Alpha):",
                min = 0, max = 1,
                value = 0.5) %>% 
      bslib::tooltip("Adjust point transparency: 0 = invisible, 1 = opaque"),
    
    hr(),
    
    h5("📅 Time Filter"),
    HTML(paste0("<p><small>Filter movies by release date (", min_date, " to ", max_date, ")</small></p>")),
    
    dateRangeInput(
      inputId = "date",
      label = "Date Range:",
      start = min_date, end = max_date,
      min = min_date, max = max_date,
      startview = "year"
    ),
    
    hr(),
    
    h5("🔍 Interactive Analysis"),
    
    actionButton(
      inputId = "toggle_model",
      label = "Toggle Regression Line",
      icon = icon("chart-line"),
      class = "btn-primary btn-sm",
      width = "100%"
    )
  ),
  
  # Output: Show scatterplot
  navset_card_pill(
    nav_panel("📊 Main Plot", 
              div(class = "alert alert-info", style = "margin-bottom: 15px;",
                  HTML("<strong>📈 Overview Visualization</strong><br>
                       <small>Explore your data with different plot types. All plots are filtered by your selected date range.</small>")),
              card(plotOutput(outputId = "scatterplot1")),
              layout_columns(card("📊 X Variable Distribution", plotOutput(outputId = "densityplot", height = 200)), 
                             card("📋 Complete Dataset", dataTableOutput(outputId = "moviestable1")))),
    nav_panel("🔍 Interactive Analysis", 
              div(class = "alert alert-success", style = "margin-bottom: 15px;",
                  HTML("<strong>🎯 Interactive Data Selection</strong><br>
                       <small><strong>Drag</strong> on the plot to select points, then use the <strong>Toggle Regression Line</strong> button to analyze your selection.</small>")),
              card("📈 Interactive Scatter Plot", plotOutput(outputId = "scatterplot2", brush = brushOpts(id = "plot_brush"))),
              layout_columns(
                card("📋 Selected Movies", dataTableOutput(outputId = "moviestable2")),
                card("📊 Regression Analysis", verbatimTextOutput(outputId = "brushed_model"))
              )),
    nav_panel("📈 Full Dataset Model", 
              div(class = "alert alert-warning", style = "margin-bottom: 15px;",
                  HTML("<strong>🔢 Statistical Analysis</strong><br>
                       <small>Linear regression model using <strong>all filtered data</strong>. Compare with the interactive analysis in Plot2 tab.</small>")),
              card("📊 Complete Dataset Regression", verbatimTextOutput(outputId = "lmoutput"))) 
  )
)
