--- 
title: ""
subtitle:""
format:
  html:
    echo: false #turns off chunk knitting
    warning: false #removes warning
    message: false #removes install msg
    error: false #removes error messages (like NA values)
---

```{r, echo=FALSE, message=TRUE}
suppressPackageStartupMessages(library(knitr))
```



foo <- function( x, y) {
  z <- x * y
  
  return( z )
}




rm(list=ls())
x <- 10
y <- 20

foo(x,y)
