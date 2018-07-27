getwd()
setwd("c:\\r_temp")
getwd()
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
useSejongDic()
mergeUserDic(data.frame("서진수","ncn"))
data1 <- readLines("se1.txt")
data1
data2 <- sapply(data1, extractNoun,USE.NAMES=F)
data2
head(unlist(data2),30)
data3<-unlist(data2)
data3 <- unlist(data2)
data3
data3<-gsub("\\d+","",data3)
data3<-gsub("청년","",data3)
data3<-gsub("<b>","",data3)
data3<-gsub("</b>","",data3)
data3<-gsub("b","",data3)
data3<-gsub("^.$","",data3)
data3<-gsub("주거","",data3)
data3<-gsub("관련","",data3)
data3<-gsub("주택","",data3)
data3<-gsub("확대","",data3)
data3<-gsub("PD","",data3)




data3
write(unlist(data3),"seoul_2.txt")
data4<-read.table("seoul_2.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount,decreasing = T),20)


data3
write(unlist(data3),"seoul_3.txt")
data4<-read.table("seoul_3.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing=T),20)

library(RColorBrewer)
palete <- brewer.pal(9,"Set3")

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=65,
          random.order = F,random.color = T,colors=palete)
legend(0.3,1,"서울시 응답소 요청사항 분석",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")



