colors <- c("setosa" = "red", "versicolor" = "green3", "virginica" = "blue")
plot(iris[, 3:4], pch = 21, bg = colors[iris$Species], col = colors[iris$Species], asp = 1)
title("LOO")

LOO <- function(classificator){ 
  vec <- c(seq(1, 5)) 
  for (k in 1:10) { 
    cnt <- 0 
    
    for (i in 1:150) { 
      x_el <- c(iris[i, 3], iris[i, 4]) 
      x_sample <- iris[-i, 3:5] 
      class <- classificator(x_sample, x_el, k) 
      if (iris[i, 5] != class) { 
        cnt <- cnt + 1 
      } 
    } 
    vec[k] <- cnt / 150 
    otv <- c(k,vec[k])
    print(k)
    print(vec[k]) 
  } 
  return(vec)
}

arr <- LOO(kNN)
plot(c(seq(1,10)),arr,type="l",ylab="Error Rate",
     xlab="K",main="Error Rate for Iris", ylim = c(0.4, 0.6))
tochka = which(arr == min(arr))
arr2 <- (seq(1,10))
plot(arr2, arr, type = "l", xlab = "k", ylab="LOO value", main = "LOO kNN")
points(arr2[tochka], arr[tochka], pch = 19, col = "red")