setwd("C:\\r_temp")
install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP)
library(wordcloud)
useSejongDic()
useNIADic()

data1<-readLines("remake2.txt")
data1
data2 <- sapply(data1,extractNoun,USE.NAMES = F)
data2
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) <= 10}, data3)

head(unlist(data3), 30)
data3<-gsub("\\d+","",data3)
data3 <- gsub("쌍수","쌍커풀",data3)
data3 <- gsub("쌍커풀","쌍커풀",data3)
data3 <- gsub("메부리코","매부리코",data3)
data3 <- gsub("\\.","",data3)
data3 <- gsub(" ","",data3)
data3 <- gsub("하이","",data3)
data3 <- gsub("지식iN","",data3)
data3 <- gsub("경우","",data3)
data3 <- gsub("재수","",data3)
data3 <- gsub("답변","",data3)
data3 <- gsub("안녕","",data3)
data3 <- gsub("\\'","",data3)
data3 <- gsub("조회","",data3)
data3 <- gsub("네이버","",data3)
data3 <- gsub("의$","",data3)
data3 <- gsub("때문","",data3)
data3 <- gsub("감사","",data3)
data3 <- gsub("사회","",data3)
data3 <- gsub("내용","",data3)
data3 <- gsub("필요","",data3)


data3

write(unlist(data3),"remake_3.txt")
write(unlist(data3),"remake_3.txt")
data4 <- read.table("remake_3.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount

head(sort(wordcount,decreasing = T),20)
txt <- readLines("성형gsub.txt")

data3
data3 <- Filter(function(x) {nchar(x) >=2},data3)
write(unlist(data3),"remake_3.txt")
data4 <- read.table("remake_3.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount,decreasing = T),30)

library(RColorBrewer)
palete <- brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=10,random.order=F,random.color=T,colors=palete)
legend(0.3,1,"성형수술 부작용 관련 키워드",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")
