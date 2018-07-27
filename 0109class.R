mat2 <- matrix(c(1,2,3,4),nrow=2)
mat2
mat3 <- matrix(c(1,2,3,4),nrow=2,byrow=T)
mat3
mat[1,1]
mat[1]
mat2[1][1]
mat2[2][2]
mat[,1]
mat2[,1]
mat2[1,1]
mat4 <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,byrow = T)
mat4

mat4<-rbind(mat4,c(11,12,13))
mat4<-cbind(mat4,c('e','f'))
mat4
colnames(mat4) <- c('First','Second','Third','forth')
mat4

array2 <- array(c(1:12),dim=c(2,2,3))
array2

season <- matrix(c('봄','여름','가을','겨울'),nrow = 2)
season
season_2 <- rbind(season,c('초봄','초가을'))
season_2
season_3 <- cbind(season_2,c('초여름','초겨울','한겨울'))
season_3
m<-matrix(c(1,2,3,4,5,6,7,8),nrow=4)
m
m[,1]
m[2,]
colnames(m)<-c('A','B')
m
mm <-cbind(m,c(9,10,11,12))
mm
n <-matrix(c(1,2,3,4,5,6,7,8),nrow=2)
n
n[1,]
nn<-rbind(n,c(9,10,11,12))
nn
colnames(n)<-c('A','B','C','D')
n
jav<-matrix(c(J,A,V,A,C,A,F,E),nrow=2,byrow = T)
jav

arr2<-array(c('O','R','A','C','L','E','S','E','R','V','E','R'),dim=c(2,6))
arr2
arr2[1,3]

arr3<-array(c(15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90),dim=c(2,4,2))
arr3

s = list(ko=90,ma=100,en=98)
s

s$sc<-100
s
s$en
s[2:3]
s$en<-95
s
