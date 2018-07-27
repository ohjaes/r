install.packages("stringr")
library(stringr)
fruits<-c('apple','Apple','banana','pineapple')
str_count(fruits,ignore.case("a"))
str_count(fruits,'a')

install.packages("sqldf")
library(sqldf)
sqldf('select * from Fruits')
sqldf('select * from Fruits where Fruit=\'Apples\'')
sqldf('select*from Fruits order by Year desc')
sqldf('select*from Fruits order by Year asc')

sqldf('select sum(Sales) from Fruits')
sqldf('select Fruit, sum(Sales) from Fruits group by Fruit')
sqldf('select Fruit,avg(Sales) from Fruits group by Fruit')
Fruits
sqldf('select Fruit,max(Sales) from Fruits')
sqldf('select count(*) from Fruits')
sqldf('select Fruit from Fruits
      where Sales=(select max(Sales) from Fruits)')
