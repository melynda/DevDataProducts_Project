library(shiny)

shinyUI(fluidPage(
  titlePanel("Exploring the Graphs of a Line, a Circle, and the Regression
             Line of a Set of Points"),
  fluidRow(
    p("This application features three graphs.  The first is produced by a 
      two variable linear equation, the second is generated from the standard
      equation of a circle, and the third shows the regression line resulting
      from four points."),
    p("The common form of a two variable linear equation is y = mx + b where 
      x and y are two variables, m is the slope (y/x) and b is the y-intercept."),
    p("The standard form of an equation for a circle is x2 + y2 = r2.  The 
      standard form of an equation for a circle on a coordinate plane is
      (x-h)2 + (y-k)2 = r2, where h and k are the x and y coordinates 
      of the circle's center, and r is the radius."),
    p("A regression line, which is the line of best fit of a set of points, 
      is represented by the equation y = ax + b.  As one or
      more points change, the regression line will change.")
    ),
  sidebarLayout(
    sidebarPanel(
      h3("Linear Equation Values"),
      h4("y = mx + b"),
      selectInput("l_color", label = h5("Select Line Color"), 
                  choices = list("blue", "red",
                                 "green", "purple"), selected = "blue"),
      sliderInput('l_x', "x (variable 1)",value = 1, min = -25, max = 25, step = 1),
      sliderInput('l_y', "y (variable 2)",value = 1, min = -25, max = 25, step = 1),
      sliderInput('l_b', "b (y-intercept)",value = 0, min = -25, max = 25, step = 1),
      
      h3("Circle Equation Values"),
      h4("(x-h)2 + (y-k)2 = r2"),
      selectInput("cir_color", label = h5("Select Circle Color"), 
                choices = list("blue", "red",
                               "green", "purple"), selected = "red"),
      sliderInput('c_h', "h (x-coordinate of the circle's center)",value = 0, min = -25, max = 25, step = 1),
      sliderInput('c_k', "k (y-coordinate of the circle's center)",value = 0, min = -25, max = 25, step = 1),
      sliderInput('c_r', "r (radius)",value = 4, min = 1, max = 6, step = 1),
      
      h3("Values for Regression Model"),
      h4("y = ax + b"),
      selectInput("reg_color", label = h5("Select Line Color"), 
                  choices = list("blue", "red",
                                 "green", "purple"), selected = "purple"),
      sliderInput('x1', "x1",value = 0, min = 0, max = 10, step = 1),
      sliderInput('y1', "y1",value = 1, min = 0, max = 10, step = 1),
      sliderInput('x2', "x2",value = 2, min = 0, max = 10, step = 1),
      sliderInput('y2', "y2",value = 1, min = 0, max = 10, step = 1),  
      sliderInput('x3', "x3",value = 3, min = 0, max = 10, step = 1),
      sliderInput('y3', "y3",value = 4, min = 0, max = 10, step = 1),
      sliderInput('x4', "x4",value = 4, min = 0, max = 10, step = 1),
      sliderInput('y4', "y4",value = 4, min = 0, max = 10, step = 1)
    ),
    mainPanel(
      textOutput('inst1'),
      textOutput("slope"),
      textOutput("equation"),
      plotOutput('linearPlot'),
      textOutput('inst2'),
      plotOutput('circularPlot'),
      textOutput('inst3'),
      plotOutput('regPlot'),
      textOutput("eqExpl"),
      textOutput("plotPoints")
    )
  )
))


