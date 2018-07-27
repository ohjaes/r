getwd()
view(exam)
View(exam)
exam<-read.csv("csv_exam.csv")
View(exam)
str(exam)
summary(exam)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
str(mpg)
summary(mpg)

install.packages("dplyr")
library(dplyr)
df_raw <- data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_new<-df_raw
df_new
df_new<-rename(df_new,v2=var2)
df_new

mpg
df_mpg <- mpg
df_mpg<-rename(df_mpg,city=cty)
df_mpg<-rename(df_mpg,highway=hwy)
mpg<-df_mpg

df<-data.frame(var1=c(4,3,8),var2=c(2,6,1))
df
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1+df$var2)/2
df
mpg$total <- (mpg$city+mpg$highway)/2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
mpg$test <- ifelse(mpg$total>=20,'pass','fail')
head(mpg,20)
table(mpg$test)
qplot(mpg$test)
library(ggplot2)
qplot(mpg$test)

mpg$grade<-ifelse(mpg$total>=30,"A",ifelse(mpg$total>=20,"B","C"))
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)

midwest
df_midwest<-midwest
df_midwest<-rename(df_midwest,total=poptotal)
df_midwest<-rename(df_midwest,asian=popasian)
df_midwest$percent<-(df_midwest$asian/df_midwest$total)*100
head(df_midwest)
View(df_midwest)
hist(df_midwest$percent)
df_midwest$mean_percent<-mean(df_midwest$percent)
df_midwest$size<-ifelse(df_midwest$percent > df_midwest$mean_percent,"large","small")
table(df_midwest$size)
qplot(df_midwest$size)


??ggplot2
install.packages("googleVis")
library(googleVis)
Fruits
aggregate(Sales~Year,Fruits,sum)
aggregate(Sales~Fruit,Fruits,sum)
aggregate(Expenses~Location,Fruits,mean)
aggregate(Sales~Fruit+Location,Fruits,sum)

mat1<-matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
mat1
apply(mat1, 1, sum)
apply(mat1, 2, sum)
apply(mat1[,c(2,3)], 2, max)

list1<-list(Fruits$Sales)
list1
list2<-list(Fruits$Profit)
lapply(c(list1,list2), max)
sapply(c(list1,list2), max)
lapply(Fruits[,c(4,5)],max)
sapply(Fruits[,c(4,5)],max)

tapply(Sales,Fruits,sum)
attach(Fruits)
tapply(Sales,Fruits,sum)
tapply(Sales,Year,sum)

mat1
a<-c(1,1,1)
sweep(mat1,2,a)
a<-c(1,2,3,4,5)
length(a)
length(Fruits)

ggplot2::geom_bar
sort1<-Fruits$Sales
sort1
sort(sort1)
sort(sort1,decreasing = T)

install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

fruits <-read.csv("fruits_10.csv",header=T)
fruits
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_prise=sum(price))

data1<-read.csv("2013년_프로야구선수_성적.csv")
data1
nrow(data1)
data2<-filter(data1,경기>120)
data2
data3<-filter(data1,포지션 %in% c('1루수','3루수'))
data3
ncol(data3)
data4<-filter(data1,경기>120 & 득점>80)
data4
select(data1,선수명,포지션,팀)

select(data1,순위:타수)
select(data1,-홈런,-타점,-도루)
data1 %>% select(선수명,팀,경기,타수) %>% filter(타수>400)
data1 %>% select(선수명,팀,경기,타수) %>% filter(타수>400) %>% arrange(타수)

mu<-data1 %>% select(선수명,팀,경기,타수) %>% mutate(경기x타수 = 경기*타수) %>% arrange(경기x타수) 
mu

data1 %>% group_by(팀) %>% summarise(average = mean(경기,na.rm=T))
data1 %>% group_by(팀) %>% summarise_each(funs(mean,n()),경기,타수)
    
Fruits                                     
