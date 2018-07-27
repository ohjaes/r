getwd()
data1 <- read.csv("2013년_서울_주요구별_병원현황.csv",header=T)
data1
barplot(as.matrix(data1[1:9,2:11]),main=paste("서울시 주요 구별 과목별 병원현황-2013년","\n","출처[국민건강보험공단]"),ylab="병원수",beside=T,col=rainbow(8),ylim=c(0,350))
abline(h=seq(0,350,10),lty=3,lwd=0.2)
name<-data1$표시과목
name
legend(75,350,name,cex=0.8,fill=rainbow(8),bg="white")
savePlot("hospital.png",type="png")

data1<-read.csv("2013년_서울_주요구별_병원현황.csv",header=T)
v1<-data1[1:9,2]*0.1
v2<-data1[1:9,3]*0.1
v3<-data1[1:9,4]*0.1
v4<-data1[1:9,5]*0.1
v5<-data1[1:9,6]*0.1
v6<-data1[1:9,7]*0.1
v7<-data1[1:9,8]*0.1
v8<-data1[1:9,9]*0.1
v9<-data1[1:9,10]*0.1
v10<-data1[1:9,11]*0.1
par(mfrow=c(2,5))
name <- data1$표시과목
name

gangnam <- barplot(as.matrix(v1), main="강남구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

gangdong <- barplot(as.matrix(v2),main="강동구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

gangseo <- barplot(as.matrix(v3),main="강서구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

gwanak <- barplot(as.matrix(v2),main="강악구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

guro <- barplot(as.matrix(v2),main="구로구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

dobong <- barplot(as.matrix(v2),main="도구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

dongdaemun <- barplot(as.matrix(v2),main="동대문구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

dongjak <- barplot(as.matrix(v2),main="동구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

mapo <- barplot(as.matrix(v2),main="마포구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

seodaemun <- barplot(as.matrix(v2),main="서대문구 병원현황",beside=T,axes=F,ylab="병원수(단위:10개)",xlab="",cex.names=0.85,las=2,ylim=c(0,40),col=rainbow(8),border="white",names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)






