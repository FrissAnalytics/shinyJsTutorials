shinyServer(function(input, output, session) {

  # make sure we get the same data each time
  set.seed(1000)

  # create data for 30 days
  n <- 30

  # start date
  start_date = as.Date("2016-10-01")

  output$chart <- renderC3StackedChart({
    dataset <- data.frame(
      Time  = start_date + 1:n ,
      data1 = getSeries(n = n, drift = 0.3, walk = 3, scale = 30),
      data2 = getSeries(n = n, drift = 0.1, walk = 4, scale = 20),
      data3 = getSeries(n = n, drift = 0.2, walk = 3, scale = 30)
    )

    C3StackedChart(dataset  = dataset,
                   types    = list(data1 = "bar"  , data2 = "bar"   , data3 = "bar"),
                   colors   = list(data1 = "purple", data2 = "blue", data3 = "gray"),
                   groups   = c("data1","data2","data3"))
  })

  # update 1
  observeEvent(input$update1, {
    c3ChartProxy("chart") %>% zoomChart("2016-10-01", "2016-10-15")
  })

  # update 2
  observeEvent(input$update2, {
    c3ChartProxy("chart") %>% zoomChart("2016-10-16", "2016-10-30")
  })

  # update 3
  observeEvent(input$update3, {
    c3ChartProxy("chart") %>% zoomChart("2016-10-01", "2016-10-15") %>% setColors(list(data1 = "green", data2 = "orange", data3 = "red"))
  })

  # update 4
  observeEvent(input$update4, {
    c3ChartProxy("chart") %>% setColors(list(data1 = "green", data2 = "orange", data3 = "red"))
  })

  # update 5
  observeEvent(input$update5, {
    c3ChartProxy("chart") %>% setColors(list(data1 = "purple", data2 = "blue", data3 = "gray"))
  })

  # update 6
  observeEvent(input$update6, {
    c3ChartProxy("chart") %>% zoomChart("2016-10-01", "2016-10-30")
  })

  # update 7
  observeEvent(input$update7, {
    c3ChartProxy("chart") %>% setGroups(c("data1","data2"))
  })

  # update 8
  observeEvent(input$stack, {
    c3ChartProxy("chart") %>% setGroups(input$stack)
  })

  # update 9
  observeEvent(input$update_type, {
    info = list(type = input$type, series = input$dataset)
    c3ChartProxy("chart") %>% setTypes(info)
  })

  # transforms
  observeEvent(input$spline, {
    c3ChartProxy("chart") %>% transformTo(type = "spline")
  })

  observeEvent(input$line, {
    c3ChartProxy("chart") %>% transformTo(type = "line")
  })

  observeEvent(input$bar, {
    c3ChartProxy("chart") %>% transformTo(type = "bar")
  })

  observeEvent(input$area, {
    c3ChartProxy("chart") %>% transformTo(type = "area")
  })

  observeEvent(input$area_spline, {
    c3ChartProxy("chart") %>% transformTo(type = "area-spline")
  })

  # reset all
  observeEvent(input$reset, {
    c3ChartProxy("chart") %>% setColors(list(data1 = "purple", data2 = "blue", data3 = "gray")) %>%
      transformTo(type = "bar") %>%
      setGroups(c("data1","data2","data3")) %>% zoomChart("2016-10-01", "2016-10-30")
  })

})
