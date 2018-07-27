getwd()
setwd("c:\\r_temp")
getwd()
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
useSejongDic()
mergeUserDic(data.frame("서진수","ncn"))
useNIADic()
data1 <- readLines("se1.txt")
data1
data2 <- sapply(data1, extractNoun,USE.NAMES=F)
data2
head(unlist(data2),30)
data3<-unlist(data2)
data3 <- unlist(data2)
data3
data3<-gsub("\\d+","",data3)
data3<-gsub("<b>","",data3)
data3<-gsub("</b>","",data3)
data3<-gsub("b","",data3)
data3<-gsub("^.$","",data3)
data3<-gsub("^주거$","",data3)
data3<-gsub("^관련$","",data3)
data3<-gsub("^주택$","",data3)
data3<-gsub("^확대$","",data3)
data3<-gsub("^PD$","",data3)
data3<-gsub("^신청$","",data3)
data3<-gsub("^가$","",data3)
data3<-gsub("^들이$","",data3)
data3<-gsub("^하기$","",data3)
data3<-gsub("^이$","",data3)
data3<-gsub("^해결$","",data3)
data3<-gsub("^이번$","",data3)
data3<-gsub("^apos$","",data3)
data3<-gsub("^quot$","",data3)
data3<-gsub("^기자","",data3)
data3<-gsub("^[:alpha:]+$","",data3)
data3<-gsub("m","",data3)
data3<-gsub("kr","",data3)
data3<-gsub("co","",data3)
data3<-gsub("tg","",data3)
data3<-gsub("vs","",data3)
data3<-gsub("is","",data3)
data3<-gsub("t","",data3)
data3<-gsub("of","",data3)
data3<-gsub("g","",data3)
data3<-gsub("Ic","",data3)
data3<-gsub("kbs","",data3)
data3<-gsub("SNS","",data3)
data3<-gsub("IS","",data3)
data3<-gsub("KBS","",data3)
data3<-gsub("e","",data3)




data3
write(unlist(data3),"seoul_2.txt")
data4<-read.table("seoul_2.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount,decreasing = T),20)


##data3
##write(unlist(data3),"seoul_3.txt")
##data4<-read.table("seoul_3.txt")
##wordcount<-table(data4)
##head(sort(wordcount,decreasing=T),20)


library(RColorBrewer)
palete <- brewer.pal(12,"Set3")

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.1,min.freq=10,
          random.order = F,random.color = T,colors=palete)
legend(0.3,1,"살기 좋은 도시 추천",cex=1.0,fill=NA,border=NA,bg="white",text.col="blue",text.font=3,box.col="red")



