getwd()
list.files()
list.files(recursive = T)
list.files(all.files = T)
scan1<-scan('scan_1.txt')
scan1
scan2 <- scan('scan_2.txt')
scan2
scan2 <- scan('scan_2.txt',what="")
scan2
input<-scan()
input
input2<-scan(what="")

fruit <-read.table("fruits.txt",header = T)
fruit

fruit2<-read.table("fruits_2.txt")
fruit2
fruit3<-read.table("fruits_2.txt",skip=2)##skip은 주석까지 포함하여 제거
fruit3
class(fruit3)

df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

fruit4 <-read.csv("fruits_4.csv",header=F)
fruit4

label<-c('NO','NAME','PRICE','QTY')

install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits
write.csv(Fruits,"Fruits_sql.csv",quote=F, row.names = F)
fruits_2 <- read.csv.sql("Fruits_sql.csv",sql="SELECT*FROM file WHERE Year=2008")
fruits_2
fruits_2 <- read.csv.sql("Fruits_sql.csv",sql="SELECT * FROM file WHERE Sales>=90")
fruits_2

install.packages("readxl")
library(readxl)
df_exam<-read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=2)
df_exam_sheet

fruits6 <- read.delim("clipboard",header = T)
fruits6

install.packages("WriteXLS")
library(WriteXLS)
WriteXLS("df_exam_sheet","item.xls")

install.packages("XML")
library(XML)

View(fruits6)
dim()
dim(fruits6)
str(fruits6)
summary(fruits6)
