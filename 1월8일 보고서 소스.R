vec1 <- c(1,2,3,4,5)
vec1[1]
vec1[5]
vec1[-1]
vec1
vec1[9]<-9
vec1
append(vec1,10,after=3)
append(vec1,c(10,11),after=3)

var1<-c(1,2,3)
var2<-c("1","2","3","4")
union(var1,var2)

var1<-c(1,2,3)
var2<-c(3,4,5)
var1-var2
setdiff(var1,var2)
setdiff(var2,var1)
intersect(var1,var2)
names(var2)
fruits<-c(10,20,30)
fruits
names(fruits) <- c('apple','banana','peach')
fruits
class(fruits)

var7<-c(1,3,5,7,9)
3%in%var7
4%in%var7

date4 <-seq(from=as.Date('2014-01-01'),to=as.Date('2014-05-31'),by='day')

vec1<-c('사과','배','감','버섯','고구마')
vec1
vec1[-3]

vec1<-c('봄','여름','가을','겨울')
vec2<-c('봄','여름','늦여름','초가을')
intersect(vec1,vec2)

v1 <- seq(1:10)
v1[9]<-"0"
print(v1)
class(v1)
append(v1,0,after=0)
v1[11]<-11
v1
v1<-append(v1,c(14:20),after = 11)
v1
v1<-append(v1,c(12,13),after = 11)
v1
v2<-100
v2
v1+v2
v2 <-c(100,200,300)
v2
v1+v2
intersect(v1,v2)
setdiff(v1,v2)
union(v1,v2)
interaction(v2,v1)
intersect(v2,v1)
names(v2)<-c("A","B","C")
v2
v3 <- seq(5,50,5)
v3
v4 <- rep(5:6,3)
v4
v5 <- rep(-1:1,each=3)
v5
length(v5)
vv<- 55 %in% v3
vv
