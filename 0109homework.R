df_midterm <-data.frame(english=c(90,80,60,70),math=c(50,60,100,20)
                        ,class=c(1,1,2,2))
df_midterm

sales2 <- matrix(c(1,'Apple',500,5,2,'Peach',200,2
                   ,3,'Banana',100,4,4,'Grape',50,7),nrow=4,byrow=T)
sales2
df1 <- data.frame(sales2)
df1

names(df1) <-c('NO','NAME','PRICE','QTY')
df1
class(df1)
df1$NO
df1$NAME
df1$PRICE
df1$QTY
class(df1$NO)
class(df1$NAME)
class(df1$PRICE)
df1[1,3]
df1[1,]
df1[,3]
df1[c(1,2)]
df1[c(1,2),]
df1[c(1)]
subset(df1,QTY<5)
subset(df1,PRICE==200)
subset(df1,NAME==Apple)
subset(df1,NAME == 'Apple')

df1<-data.frame(name=c('apple','banana','cherry'),price=c(300,200,100))
df2<-data.frame(name=c('apple','cherry','berry'),qty=c(10,20,30))
df1
df2
merge(df1,df2)
merge(df1,df2,all=T)

df3<-subset(df1,select=-QTY)
df3
rownames(df1)
df1<-data.frame(NO=c(1,2,3),NAME=c('apple','banana','peach'),PRICE=c(100,200,300))
df1
df2<-data.frame(NO=c(10,20,30),NAME=c('train','car','airplane'),PRICE=c(1000,2000,3000))
df2

s<-data.frame(name=c('김길동','강길동','박길동'),kor=c(100,90,85),mat=c(90,95,98),eng=c(80,98,100))
s
colnames(s)
nrow(s)
s[,c(1,2)]
s[,c(1,3)]
subset(s,select = name)
subset(s,kor>=90)
subset(s,name == '박길동')
rbind(s,data.frame(name='최길동',kor=85,mat=98,eng=100))

t<-data.frame(name=c('강길동','박길동','최길동'),kor=c(100,90,92),mat=c(90,95,100))
t
t<-cbind(t,data.frame(sci=c(88,80,94)))
t
ncol(s)
subset(s,select)      
s[c(1,3),]
subset(s,select=-name)
s[,c(1,4,2,3)]
s

merge(s,t)
merge(s,t,all=T)
cbind(s,t)
cbind(t,s)
tt<-subset(t,select=c(name,kor,mat))
tt
ss<-subset(s,select=c(name,kor,mat))
ss

rbind(tt,ss)
rbind(ss,tt)
