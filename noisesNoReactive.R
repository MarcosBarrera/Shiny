

normalNoise <- function(im, mean=0, sd=40) {
  im + rnorm(length(im), mean=mean, sd=sd)
}

uniformNoise = function(im, mean=0, sd=0) {
  im + runif(length(im), mean=mean, sd=sd)
}

verticalLinesNoise <- function(im, prob=0) {
  lineasAOscurecer <- sample(1:ncol(im), round(prob*ncol(im),0))
  im[lineasAOscurecer,] <- -127
  return(im)
}

zeroingNoise = function(im, prob=0.1){
  puntosAoscurecer = sample(28*28, round((28*28)*prob,0))
  im
  }
# introducir un 0 randomly X[sample(10*10, 1)] <- 0




