x <- c(1,2,3)
mean(x)
max(x)
min(x)
str5<-c("Hello","world","is","good!")
paste(str5,collapse = ",") ##?‰¼?‘œë¥? ê¸°ì?€?œ¼ë¡? ?´?–´ì£¼ëŠ” ?•¨?ˆ˜
install.packages("ggplot2")
library(ggplot2)
x <- c("a","a","b","c")
qplot(x)
qplot(data = mpg,x=hwy)
qplot(data = mpg, x=cty)
qplot(data = mpg,x=drv,y=hwy)
qplot(data = mpg,x=drv,y=hwy,geom="line")
qplot(data = mpg,x=drv,y=hwy,geom="boxplot")
qplot(data = mpg,x=drv,y=hwy,geom="boxplot",colour = drv)


score <- c(80,60,70,50,90)
score
score_mean<-mean(score)
score_mean

pi
print(pi,digits=3)
print(pi,digits=20)
print(3,4)
print('a','b')
cat(1,':','a','\n',2,':','b')

10000
100000
1000000

num <-c(1,2,3,4,5)
class(num)

sum(1,2,NA)
sum(1,2,NA,na.rm = T)
var(x)
sqrt(x)

var1<-c(1,2,3,4,5,6,7)
var2<-c(1,2,3,4)
var1+var2

date2 <-seq(from=as.Date('2014-01-01'),to=as.Date('2014-05-31'),by='month')
date3 <-seq(from=as.Date('2014-01-01'),to=as.Date('2020-05-31'),by='year')

date2
date3
date4 <-seq(from=as.Date('2014-01-01'),to=as.Date('2014-05-31'),by='day')
date4

seq1<-1:5
seq1
objects()
objects(all.names = T)
rm(str5)
str5
rm(list=ls())
