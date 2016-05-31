# Unit 4 homework
Alex Deshowitz  
May 30, 2016  
#### This Markdown File will illustrate the central limit theorem at work via bootstrapping

###### The central limit theorem states that as we sample more and more, the distribution of the sample means approaches that of a normal distribution.  We can think of it as looking at the probabilities of certain combinations happening multiple times becoming more scarce.  This applies to both normally distributed samples and non-normal samples.

* First, let's create 4 random samples, 2 of a normal distribution and 2 from exponential distributions


```r
x_n<- rnorm(10,22,5)
y_n<- rnorm(60,22,5)

x_e<- rexp(10,1)
y_e<- rexp(60,1)
```

* Now, we have 4 random samples "n" samples are normal distributions and "e" samples are exponential
* Let's look at the data


```r
hist(x_n, main = "10 sample normal")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
hist(y_n, main = "60 sample normal")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-2-2.png)<!-- -->

```r
hist(x_e, main = "10 sample exponential")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-2-3.png)<!-- -->

```r
hist(y_e, main = "60 sample exponential")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-2-4.png)<!-- -->

* It looks like our smaller (10 sample size) do not necessarily match the distributions we would expect, so let's bootstrap everything.  Also, notice that the exponential distributions do resemble what we would expect this type of distribution to look like

* For reference let's look at the means of the sample data



```r
x_n_mean<- mean(x_n)
x_n_mean
```

```
## [1] 22.66101
```

```r
y_n_mean<- mean(y_n)
y_n_mean
```

```
## [1] 22.80392
```

```r
x_e_mean<- mean(x_e)
x_e_mean
```

```
## [1] 1.026376
```

```r
y_e_mean<- mean(y_e)
y_e_mean
```

```
## [1] 0.8511686
```
* For reference let's also look at the standard deviations of the sample data



```r
x_n_sd<- sd(x_n)
x_n_sd
```

```
## [1] 3.90293
```

```r
y_n_sd<- sd(y_n)
y_n_sd
```

```
## [1] 4.766411
```

```r
x_e_sd<- sd(x_e)
x_e_sd
```

```
## [1] 0.908141
```

```r
y_e_sd<- sd(y_e)
y_e_sd
```

```
## [1] 0.7452849
```
* Now for the bootstrap, we will run 1000 samples for everything
* Notice that we setup a resultset for each set of sample means for both normal and exponential distributions

```r
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
```

* Now, let's look at the distributions of our bootstrapped means to see if the central limit theorem holds true

```r
hist(x_n_bootmean, main = "10 sample normal bootstrap")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

* See, now our 10 sample size distribution looks more normal, subject to change, but my result had a left skew


```r
hist(y_n_bootmean, main = "60 sample normal bootstrap")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

* More normal than before, although with an n=60 we looked pretty good from the start


```r
hist(x_e_bootmean, main = "10 sample exponential bootstrap")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

* But wait!  We wanted an exponential distribution!  Yes, but remember what the CLT says!  This is exactly what we would expect.  As we sampled from the smaller exponential our data became normally distributed due to the probability of generating more obscure/less likely samples!


```r
hist(y_e_bootmean, main = "60 sample exponential bootstrap")
```

![](ADeshowitz_DDS_Homework4_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

* The same goes for this set of data.  We have illustrated the central limit theorem via bootstrapping.

* As a final view, we want to see if our means stayed the same and our std. dev went down by the sqrt of N

* First let's look at the means


```r
mean(x_n_bootmean)
```

```
## [1] 22.62673
```

```r
mean(y_n_bootmean)
```

```
## [1] 22.82094
```

```r
mean(x_e_bootmean)
```

```
## [1] 1.010814
```

```r
mean(y_e_bootmean)
```

```
## [1] 0.856114
```

####HOOARY!  The means are the same!!  Check that box!

* Now, let's check the standard deviations

```r
sd(x_n_bootmean)
```

```
## [1] 1.156569
```

```r
sd(y_n_bootmean)
```

```
## [1] 0.5795539
```

```r
sd(x_e_bootmean)
```

```
## [1] 0.2735375
```

```r
sd(y_e_bootmean)
```

```
## [1] 0.09776064
```


#### Great, our standard deviations look good as well.

## In Closing, we have used Bootstrap to satisfy the elements of the central limit theorem.  
### **First**, we see that regardless of the sample distribution, our samples approach a normal distribution as both sample size and the number of samples grow
### **Second**, we see that our means remain unchanged per the theorem
### **Third**, our standard errors become the decline of the standard deviation of hte original samples divided by sqrt(n) 





