
shinyServer(
  function(input, output) {
  output$slope <- renderText({
      lin_x <- input$l_x; # x value
      lin_y <- input$l_y; # y value
      lin_b <- input$l_b; # y-intercept
      slope <- (lin_y - lin_b)/lin_x; # calculate the slope
      lin_m <- round(slope, digits=2);
      paste("Calculated slope = ", lin_m)
  })
   output$eqExpl <- renderText({
     paste("y = ax + b, where a equals the sums of the difference of each point from the mean 
         divided by the sums of the difference of each square of x minus the 
         square of the mean of x.")
   })
   output$inst1 <- renderText({
     paste("Instructions: Use the sliders on the left to alter the values of x, y, and b.  
     The input values will determine the slope and the resulting line on the graph.")
   })
  output$inst2 <- renderText({
    paste("Instructions: Use sliders on the left to alter the values of h, k, and r. 
    The input values will determine the size and position of the circle.")
  })
  output$inst3 <- renderText({
    paste("Instructions: Use the sliders on the left to alter the points, 
          and watch the resulting regression line change.")
  })
   output$equation <- renderText({
     lin_x <- input$l_x; # x value
     lin_y <- input$l_y; # y value
     lin_b <- input$l_b; # y-intercept
     slope <- (lin_y - lin_b)/lin_x; # calculate the slope
     lin_m <- round(slope, digits=2);
     paste("Equation = ", lin_y, " = " , lin_m, " * ", lin_x, " + ", lin_b)
   })
    output$plotPoints <- renderText({
      x1 <- input$x1; # x1 value
      y1 <- input$y1; # y1 value
      x2 <- input$x2; # x2 value
      y2 <- input$y2; # y2 value
      x3 <- input$x3; # x3 value
      y3 <- input$y3; # y3 value
      x4 <- input$x4; # x4 value
      y4 <- input$y4; # y4 value
      paste("Selected plot points = (", x1, ",", y1, "), (", x2, ",", y2, "), (", x3, ",", y3, "), and (", x4, ",", y4, ")")
    })
    output$regPlot <- renderPlot({
      x <- seq(from=-2, to=10, by=1);
      x1 <- input$x1; # x1 value
      y1 <- input$y1; # y1 value
      x2 <- input$x2; # x2 value
      y2 <- input$y2; # y2 value
      x3 <- input$x3; # x3 value
      y3 <- input$y3; # y3 value
      x4 <- input$x4; # x4 value
      y4 <- input$y4; # y4 value
      x_reg <- c(x1, x2, x3, x4)
      y_reg <- c(y1, y2, y3, y4)
#      regMdl <- lm(y_reg ~ x_reg)
       mean_x <- mean(c(x1, x2, x3, x4))
       mean_y <- mean(c(y1, y2, y3, y4))
       mean_xy <- mean_x * mean_y
       mean_x_sq <- mean_x * mean_x
       n <- 4
       slope_reg <- ((x1*y1 - n*mean_xy) + (x2*y2 - n*mean_xy) + (x3*y3 - n*mean_xy) + (x4*y4 - n*mean_xy)) / ((x1*x1 - n*mean_x_sq) + (x2*x2 - n*mean_x_sq) + (x3*x3 - n*mean_x_sq) + (x4*x4 - n*mean_x_sq))
       intercept_reg <- mean_y - (slope_reg * mean_x)
      plot(x_reg, y_reg, xlim=c(-2,10), ylim=c(-2,10), asp=1, 
           xlab="X", ylab="Y", 
           main="Graph of a Regression Line");
      abline(a=intercept_reg,b=slope_reg,col=input$reg_color,lwd=2)  # regression line for the points selected
#      abline(regMdl, col=input$reg_color, lwd=2)
      abline(v=0,col="black")  # vertical line at zero
      abline(h=0,col="black")  # horizontal line at zero
      abline(v=-2,col="lightgray")  # grid line
      abline(v=-4,col="lightgray")  # grid line
      abline(v=-6,col="lightgray")  # grid line
      abline(v=-8,col="lightgray")  # grid line
      abline(v=-10,col="lightgray")  # grid line
      abline(v=2,col="lightgray")  # grid line
      abline(h=2,col="lightgray")  # grid line
      abline(v=4,col="lightgray")  # grid line
      abline(h=4,col="lightgray")  # grid line
      abline(v=6,col="lightgray")  # grid line
      abline(h=6,col="lightgray")  # grid line
      abline(v=8,col="lightgray")  # grid line
      abline(h=8,col="lightgray")  # grid line
      abline(v=10,col="lightgray")  # grid line
      abline(v=12,col="lightgray")  # grid line
      abline(v=14,col="lightgray")  # grid line
      abline(v=16,col="lightgray")  # grid line
    })
    output$linearPlot <- renderPlot({
      x <- seq(from=-25, to=25, by=1);
      lin_x <- input$l_x; # x value
      lin_y <- input$l_y; # y value
      lin_b <- input$l_b; # y-intercept
      lin_m <- (lin_y - lin_b)/lin_x; # calculate the slope
      plot(0,0, xlim=c(-25,25),ylim=c(-25,25), type="l", asp=1, 
            xlab="X", ylab="Y", 
            main="Graph of a Linear Equation");
      
      # Create the grid lines
      abline(v=0,col="black")  # vertical line at zero
      abline(h=0,col="black")  # horizontal line at zero
      abline(v=10,col="lightgray")  # grid line
      abline(h=10,col="lightgray")  # grid line
      abline(v=20,col="lightgray")  # grid line
      abline(h=20,col="lightgray")  # grid line
      abline(v=-10,col="lightgray")  # grid line
      abline(h=-10,col="lightgray")  # grid line
      abline(v=-20,col="lightgray")  # grid line
      abline(h=-20,col="lightgray")  # grid line
      abline(v=30,col="lightgray")  # grid line
      abline(h=30,col="lightgray")  # grid line
      abline(v=40,col="lightgray")  # grid line
      abline(h=40,col="lightgray")  # grid line
      abline(v=-30,col="lightgray")  # grid line
      abline(h=-30,col="lightgray")  # grid line
      abline(v=-40,col="lightgray")  # grid line
      abline(h=-40,col="lightgray")  # grid line
      abline(v=50,col="lightgray") #grid line
      abline(v=-50,col="lightgray") #grid line
      abline(a=lin_b,b=lin_m,col=input$l_color,lwd=2)  # line from the linear equation based on the inputs
    })
     output$circularPlot <- renderPlot({
       x <- seq(from=-25, to=25, by=1);
       cir_h <- input$c_h; # h value
       cir_k <- input$c_k; # k value
       cir_r <- input$c_r; # radius
       cir_r_sq <- cir_r*cir_r
       plot(0,0, xlim=c(-25,25),ylim=c(-25,25), type="l", asp=1, xlab="X", ylab="Y", main="Graph of a Circle");
       curve(( 1 * (cir_r_sq^2 - (x - cir_h)^2)^0.5 ) + cir_k, add=TRUE, col=input$cir_color, lwd=2, from=(cir_h - cir_r_sq), to=(cir_h + cir_r_sq))
       curve(( -1 * (cir_r_sq^2 - (x - cir_h)^2)^0.5 ) + cir_k, add=TRUE, col=input$cir_color, lwd=2, from=(cir_h - cir_r_sq), to=(cir_h + cir_r_sq))
       
       # Create the grid lines
       abline(v=0,col="black")  # vertical line at zero
       abline(h=0,col="black")  # horizontal line at zero
       abline(v=10,col="lightgray")  # grid line
       abline(h=10,col="lightgray")  # grid line
       abline(v=20,col="lightgray")  # grid line
       abline(h=20,col="lightgray")  # grid line
       abline(v=-10,col="lightgray")  # grid line
       abline(h=-10,col="lightgray")  # grid line
       abline(v=-20,col="lightgray")  # grid line
       abline(h=-20,col="lightgray")  # grid line
       abline(v=30,col="lightgray")  # grid line
       abline(h=30,col="lightgray")  # grid line
       abline(v=40,col="lightgray")  # grid line
       abline(h=40,col="lightgray")  # grid line
       abline(v=-30,col="lightgray")  # grid line
       abline(h=-30,col="lightgray")  # grid line
       abline(v=-40,col="lightgray")  # grid line
       abline(h=-40,col="lightgray")  # grid line
       abline(v=50,col="lightgray") #grid line
       abline(v=-50,col="lightgray") #grid line
     })
  }
)
