# 1:가구원 2:가구용
#성별 23행 2
#나이 24행 1 
#혼인상태 29행 1
#종교 30행 2
#월급 59 1
#직종코드 251 2
#지역코드 8 2

#주거위치  h1006_2,  2
#가처분소득 h10_din, 2
#인터넷사용 여부 p1003_1, 1




#age_income :연령별 월급 구할때사용
#ageg_divorce : 연령대별 이혼율
#ageg_income : 연령대별 월급
#ageg_marriage : 연령대별 결혼
#ageg_religion_marriage: 연령대별 종교별 결혼
#bottom10 : 최하10위
#df_divorce : 연령대별 종교별 이혼율

#패키지 준비
# install.packages("foreign") #foreign 패키지 설치 
# install.packages("dplyr")
# install.packages("readxl")
# install.packages("ggplot2")
# install.packages("KoNLP")
# install.packages("tm")
# install.packages("wordcloud")
# install.packages("plotrix")
getwd()
setwd("C:\\r_temp")
library(foreign) #spss파일 로드
library(dplyr) #전처리
library(ggplot2) #시각화
library(readxl) #엑셀 파일 불러오기
library(ggplot2)
library(KoNLP)
library(tm)
library(wordcloud)
library(plotrix)

#데이터 불러오기

#데이터 안들어오는거 무시하고 작업한다
raw_welfare<-read.spss(file="Koweps_hpc10_2015_beta1.sav",to.data.frame=T)
welfare<-raw_welfare #복사 파일 만들기

#데이터 검토하기
head(welfare)
dim(welfare)
str(welfare)
summary(welfare)

#변수명 바꾸기( 가독성을 위한 작업)
welfare <- rename(welfare,
                  sex = h10_g3, 
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)
####################################여기까지 준비단계###########################################

#성별 변수 검토하기(설문지에 모름을 9로 해서 9는 na로 전처리해야되는데 여기는 없어서 전처리 필요 없음)
class(welfare$sex)  #변수 타입 파악
table(welfare$sex)  #각 범주에 몇 명이 있는지 파악
#만약을 위한 이상치를 결측처리 하는 절차
welfare$sex <- ifelse(welfare$sex == 9,NA, welfare$sex)
table(is.na(welfare$sex))
#가독성을 위해 male과 female로 바꾸기
welfare$sex <- ifelse(welfare$sex == 1,'male','female')
table(welfare$sex)
qplot(welfare$sex)

#급여 변수 검토하기(필요변수 sex, income)
class(welfare$income)
summary(welfare$income) #간단한 통계
qplot(welfare$income) #그래프 그려보기
qplot(welfare$income) + xlim(0,1000) #1000넘는 데이터 별로 없어서 제한을 1000까지만
#전처리 이상치 확인
summary(welfare$income)
welfare$income<-ifelse(welfare$income %in% c(0,9999),NA,welfare$income) #0하고9999데이터를 결측치로 바꿔준다
table(is.na(welfare$income)) #NA 개수 확인

#_______________성별에 따른 월급 차이 분석______________

#성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>% #NA값이 아닌 것만 고른다
  group_by(sex) %>% #성별 별로 그룹해서
  summarise(mean_income = mean(income)) #월급의 평균을 보여준다
sex_income
#그래프 만들기
ggplot(data=sex_income,aes(x=sex,y=mean_income))+geom_col() #성별의 따른 월급의 평균을 보여주는 그래프

#____________나이와 월급의 관계_________________

#변수 검토하기(필요변수는 income, age)
class(welfare$birth)
summary(welfare$birth) #이상치 확인
qplot(welfare$birth)
table(is.na(welfare$birth)) #결측치 확인
#이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999,NA,welfare$birth)
table(is.na(welfare$birth))
#파생변수 만들기 -나이(age)
welfare$age <- 2015 - welfare$birth +1 #2015년기준 나이구하기
summary(welfare$age) #통계로 보기
qplot(welfare$age) #그래프 그려보기
#나이에 따른 월급 평균표 만들기
age_income <- welfare %>%       #수입이 없는거 빼고 나이별로 그룹화 해서 통계내보기
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
head(age_income)
ggplot(data = age_income,aes(x=age,y=mean_income)) + geom_line() #막대그래프가 아닌 라인그래프 그리기

#연령대에 따른 월급 차이
welfare <- welfare %>%
  mutate(ageg = ifelse(age<30,"young",
                       ifelse(age<=59,'middle','old'))) #연령대를 나누는 작업
table(welfare$ageg)
qplot(welfare$ageg)
#연령대에 따른 월급(평균)차이 분석하기(그룹화 시키기)
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))
ageg_income
ggplot(data=ageg_income,aes(x=ageg,y=mean_income)) + geom_col()
ggplot(data=ageg_income,aes(x=ageg,y=mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle","old")) #그래프의 순서를 바꿔주는 함수, 위 그래프와 정렬 순서가  차이가 있다.

##연령대 및 성별 원급 차이
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg,sex) %>%            #기준이 연령대와 성별 두가지라 그룹을 두개로 묶었다
  summarise(mean_income = mean(income))
sex_income
##연령대 및 성별 월급 그래프 그리기
ggplot(data = sex_income,aes(x=ageg,y=mean_income,fill=sex)) + #데이터 개수가 3개라 x좌표에연령대넣고
  geom_col() +                                                 #월급평균을 y축에 넣고 성별은 막대그래프속에 다른색(fill사용)으로 나눈다.
  scale_x_discrete(limits=c("young","middle","old"))
ggplot(data =sex_income,aes(x=ageg,y=mean_income,fill=sex))+
  geom_col(position = "dodge") +  #position=dodge를 써서 누적그래프가 아닌 따로따로 나눠서 그려준다.
  scale_x_discrete(limits = c("young","middle","old"))

#나이 및 성별 월급 차이 분석 직접해보기
#성별 연련병 월급 평균표 만들기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age,sex) %>%
  summarise(mean_income = mean(income)) #그룹을 연령대랑 성별로 묶어줘서 밑에서 라인그래프로 그래프를 그렸다
head(sex_age)
ggplot(data=sex_age,aes(x=age,y=mean_income,col=sex)) + geom_line() #col선의 색을 칠하려고 쓴다.

#직업별 월급 차이
class(welfare$code_job)
table(welfare$code_job)
library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx",col_names=T,sheet=2) #열머리글 있어서 col_names=T써줬고 시트는 2번꺼 쓰려고 sheet=2씀
head(list_job)
dim(list_job)

#job변수를 welfare에 결합하는 작업
welfare <- left_join(welfare,list_job,id="code_job") #left join으로 합쳐서 welfare기본값 옆에 job이라는 변수가 하나 더 들어간 것이다.
welfare %>%
  filter(!is.na(code_job)) %>%   #job이 있는 사람만 출력하기 위해서
  select(code_job,job) %>%
  head(10)
#직업별 월급 평균표 만들기
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)
#상위 10개 추출하기
top10<-job_income %>%
  arrange(desc(mean_income)) %>% #월급 평균 내림차순 정렬
  head(10)   #위에서 10개만 추출
top10
#그래프 그리기
ggplot(data=top10,aes(x=reorder(job,mean_income),y=mean_income)) +
  geom_col() +
  coord_flip()  #가로 막대그래프 그리려고 쓴 함
#하위 10위 추출
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)
#그래프 그리기
ggplot(data=bottom10, aes(x = reorder(job,-mean_income),y=mean_income)) + #reorder에서 -붙인 이유는 작은것부터 보여주려고
  geom_col()+
  coord_flip()+
  ylim(0,850)  #앞에 그래프와 비교하기위해서 850까지로 해놨다.

#성별 직업 빈도
job_male <- welfare %>%
  filter(!is.na(job) &sex=='male') %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>% #n()은 개수세려고 쓴 것이다.
  head(10)
job_male
job_female <- welfare %>%
  filter(!is.na(job) &sex=='female') %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>% #n()은 개수세려고 쓴 것이다.
  head(10)
job_female
#남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x=reorder(job,n),y=n)) + 
  geom_col() +
  coord_flip() #옆으로 누운 막대그래프 그리려고
#여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x=reorder(job,n),y=n)) + 
  geom_col() +
  coord_flip() #옆으로 누운 막대그래프 그리려고

#종교 유무에 따른 이혼율
class(welfare$religion)
table(welfare$religion)
#종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion == 1, "yes",
                           ifelse(welfare$religion == 9, NA ,"no")) #9는 na처리
table(welfare$religion)  #가독성을 위해 숫자를 문자로 바꿔줬다
qplot(welfare$religion)
#변수 검토하기
class(welfare$marriage)
table(welfare$marriage)
#이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage==1,"marriage",
                                 ifelse(welfare$marriage ==3, "divorce",NA)) #1과 3이 아니면 NA값으로 바꾼다
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage) #결측치로 분류된 7521명은 이후 분석에서 제외
#종교 유무에 따른 이혼율 분석하기
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion,group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct=round(n/tot_group*100,1))
religion_marriage
#이혼 데이터만 추출
divorce <- religion_marriage %>%
  filter(group_marriage == 'divorce') %>%
  select(religion,pct)
divorce
#그래프 만들기
ggplot(data = divorce,aes(x=religion,y=pct)) + geom_col()
#연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg,group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))
ageg_marriage
#초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != 'young' & group_marriage == 'divorce') %>%
  select(ageg,pct)
ageg_divorce
ggplot(data=ageg_divorce,aes(x=ageg,y=pct)) + geom_col()

#연령대, 종교유무, 결혼 상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg!='young') %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct=round(n/tot_group*100,1))
ageg_religion_marriage
#연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage =='divorce') %>%
  select(ageg, religion, pct)
df_divorce
#연령대 및 종굣 유무에 따른 이혼율 그래프 만들기
ggplot(data=df_divorce, aes(x=ageg,y=pct, fill=religion))+
  geom_col(position = "dodge")
#지역별 연령대 비율
class(welfare$code_region)
table(welfare$code_region)
#전처리
list_region <- data.frame(code_region = c(1:7), #코드만 있어서 실제 데이터만들어서 조인하려고 데이터프레임 형태로 만든다
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region
#지역별 변수 추가
welfare <- left_join(welfare,list_region, id='code_region')
welfare %>%
  select(code_region,region) %>%
  head
#지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  group_by(region,ageg) %>%
  summarise(n=n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct=round(n/tot_group*100,2))
head(region_ageg)
region_ageg <- welfare %>%
  count(region,ageg) %>%
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100,2))
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg)) + geom_col()+coord_flip()
#노년층 비율 높은 순으로 막대 정렬하기
list_order_old <- region_ageg %>%
  filter(ageg =='old') %>%
  arrange(pct)
list_order_old
order <- list_order_old$region
order
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg))+
  geom_col() +
  coord_flip()+
  scale_x_discrete(limits=order) #순서를 넘겨줘서 그 순서대로 그래프그려라
#연령대 순으로 막대 색깔 나열하기
class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg,
                           level =c("old","middle","young"))
class(region_ageg$ageg)
levels(region_ageg$ageg)
#그래프 그리기
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg)) +
  geom_col()+
  coord_flip()+
  scale_x_discrete(limits=order)

welfare
###################################################################################
#주거위치  h1006_2,  2
#가처분소득 h10_din, 2
#인터넷사용 여부 p1003_1, 1



##변수명 바꾸기( 가독성을 위한 작업)
welfare1 <- rename(welfare,
                   locate =h1006_2,
                   can_use_money=h10_din,
                   use_inter=p1003_1)
head(welfare1)
dim(welfare1)
str(welfare1)
summary(welfare1)


#가독성을 위해 층수별 이름 바꾸기
welfare1$locate <- ifelse(welfare1$locate == 1,'지하층',
                          ifelse(welfare1$locate==2,'반지하층',
                                 ifelse(welfare1$locate==3,'지상','옥탑')))
table(welfare1$locate)
qplot(welfare1$locate)

#급여 변수 검토하기(필요변수 locate, can_use_money)
class(welfare1$locate)
summary(welfare1$locate) #간단한 통계
qplot(welfare1$locate) #그래프 그려보기

#급여 변수 검토하기(필요변수 locate, can_use_money)
class(welfare1$can_use_money)
summary(welfare1$can_use_money) #간단한 통계
qplot(welfare1$can_use_money) #그래프 그려보기
qplot(welfare1$can_use_money) + xlim(0,15000) #20000넘는 데이터 별로 없어서 제한을 1000까지만
#전처리 이상치 확인
summary(welfare1$can_use_money)
table(is.na(welfare1$can_use_money)) #NA 개수 확인

##성별 월급 평균표 만들기
locate_can_use_money <- welfare1 %>%
  filter(!is.na(can_use_money)) %>% #NA값이 아닌 것만 고른다
  group_by(locate) %>% #성별 별로 그룹해서
  summarise(mean_can_use_money = mean(can_use_money)) #월급의 평균을 보여준다
locate_can_use_money
ggplot(data=locate_can_use_money,aes(x=locate,y=mean_can_use_money))+geom_col()

