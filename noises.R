# Noises.R

normalNoise <- function(im, mean = 0, sd = 0) {
  im + rnorm(length(im), mean = mean, sd = sd)
}

uniformNoise = function(im, mean=0, sd=0){
  im + runif(length(im), mean = mean, sd = sd)
}

# zeroingNoise = function(im, prob=0){
#pixelToZero = sample(1:)
#}

verticalLinesNoise <- function(im, prob=0) {
  columnasAOscurecer <- sample(1:ncol(im), round(prob*ncol(im),0))
  
  im[,columnasAOscurecer] <- -127
  return(im)
}

#whiteN

sample(500,1)
