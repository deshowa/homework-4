
x_n<- rnorm(10,22,5)
y_n<- rnorm(60,22,5)

x_e<- rexp(10,1)
y_e<- rexp(60,1)

hist(x_n, main = "10 sample normal")
hist(y_n, main = "60 sample normal")
hist(x_e, main = "10 sample exponential")
hist(y_e, main = "60 sample exponential")

x_n_mean<- mean(x_n)
x_n_mean
y_n_mean<- mean(y_n)
y_n_mean

x_e_mean<- mean(x_e)
x_e_mean
y_e_mean<- mean(y_e)
y_e_mean

s<- 1000
x_n_bootmean<- numeric(s)
y_n_bootmean<- numeric(s)

x_e_bootmean<- numeric(s)
y_e_bootmean<- numeric(s)

#normal 10 sample
for (i in 1:length(x_n_bootmean)){
  x_n_bootsample<- sample(x_n, size = length(x_n), replace = TRUE)
  
  x_n_bootmean[i]<- mean(x_n_bootsample)
}
#normal 60 sample
for (i in 1:length(y_n_bootmean)){
  y_n_bootsample<- sample(y_n, size = length(y_n), replace = TRUE)
  
  y_n_bootmean[i]<- mean(y_n_bootsample)
}

#exponential 10 sample
for (i in 1:length(x_e_bootmean)){
  x_e_bootsample<- sample(x_e, size = length(x_e), replace = TRUE)
  
  x_e_bootmean[i]<- mean(x_e_bootsample)
}
#exponential 60 sample
for (i in 1:length(y_e_bootmean)){
  y_e_bootsample<- sample(y_e, size = length(y_e), replace = TRUE)
  
  y_e_bootmean[i]<- mean(y_e_bootsample)
}

hist(x_n_bootmean, main = "10 sample normal bootstrap")
hist(y_n_bootmean, main = "60 sample normal bootstrap")
hist(x_e_bootmean, main = "10 sample exponential bootstrap")
hist(y_e_bootmean, main = "60 sample exponential bootstrap")


