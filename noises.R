library(shiny)

# Noises.R
normalN = reactiveValues(parameters = NULL)
unifN = rectiveValues(p = NULL)


observeEvent(
  input$apply_ch, {
    "input.noises == 'Normal noise'"
    normalN$parameters = input$white_p
    normalNoise = function(im, mean = 0, sd = normalN$parameters) {
      im + rnorm(length(im), mean = mean, sd = sd)
      return(im)
    }
  }
)

observeEvent(
  input$apply_ch, {
    "input.noises == 'Uniform noise'"
    unifN$p = input$white_p
    uniformNoise = function(im, mean=0, sd=unifN$p){
      im + runif(length(im), mean = mean, sd = sd)
      return(im)
    }
  }
)


#X[sample(10*10, 1)] <- 0
# zeroingNoise = function(im, prob=0){
#pixelToZero = sample(1:)
#}

verticalLinesNoise <- function(im, prob = 0) {
  columnasAOscurecer <- sample(1:ncol(im), round(prob*ncol(im),0))
  im[,columnasAOscurecer] <- -127
  return(im)
}

#whiteN

#sample(500,1)
