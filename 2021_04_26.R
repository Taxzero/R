#지난주 정리

rm(list=ls())
#FACTION 개념정리 #범주

fe_test<-c("C","B","A","C","B","B","C","C","C") #각각의 하나는 스칼라라고 함

str(fe_test) #문자

fe_test<-factor(fe_test)

str(fe_test)

library(ggplot2)
qplot(fe_test) #qplot = 시각화화


#그래프 높은 순서로 바꾸고 싶을때
####levels

a<-factor(fe_test,
          levels=c("C","B","A"))




qplot(a)
is.factor(fe_test)


as.numeric(a) #강제로 숫자 변환환
str(a)


x<-c("1","2","3")
x

result<-x*3

result<-as.numeric(x)*3

result

### 데이터 입출력 stringsAsFactor - FALSE


url<-"https://www.nrc.gov/reading-rm/doc-collections/event-status/reactor-status/powerreactorstatusforlast365days.txt"
url

url.tr<-read.table(url,sep = "|")



tr_2<-read.table("c:/ken/data/powerreactorstatusforlast365days.txt",sep = "|",header = T, nrow=1000, stringsAsFactors = F) #factor 방지



??steptime

tr_2$ReportDt<-as.data(tr_2$ReportDt, format="%m/%d/%y")
tr_2$ReportDt
head(tr_2)
class(tr_2$ReportDt)


library(readxl)
read.csv("", nrows = ) #csv는 시트 선택x
read_excel("",sheet = 1) #readxl,sheet여러개인 경우






ex_file <- read.csv("f:/webtime3/4week/14-ggplot2/1.csv", fileEncoding = 'UTF-8') #엑셀파일이 깨지는 경우
View(ex_file)

#비정형 한글 깨짐 현상 해결 encoding="UTF-8"
# txt2<-readLines("구매후기_UTF8.br)

#칼럼명이 없는 파일을 읽어 올때 지정하는 방법
#re_name1<-c("lab1),"lab2
read.csv("no_header.csv",header = F, colnames=re_name1)




#apply 계열함수 데이터 전체에 함수를 한 번에 적용하는 벡터 연산을 수행

#appl() 배열또는 행렬에 주어진 함수를 적용한 뒤 결과를 백터, 배열 또는 리스트로 변환(배열, 행렬)

#lapply() 벡터 리스트 또는 표현방식에 함수를 적용하여 그 결과를 리스트로 변환 (리스트)

#sapply() lappy()와 유사하지만 결과를 백터,행렬 또는 배열로 변환(백터,행렬, 배열)

#tapply() 특정 컬럼에 있는 값을 기준으로 모아서 집계를 한 후 지정된 작업을 수행(백터,배열)





###################33
#apply() 함수   2=열,  1=행

head(iris,3)

iris[,1:4]
#만약 떨어져있다면 iris[,c(1,3,4)]

apply(iris[,c(1:4)],2,sum) #1열부터 4열의 정보를 더하는 것 / apply(iris[,행 선택],열,sum)

#행에 대한 평균 구하기
apply(iris[,c(1:4)],1,mean)

score<-read.csv("c:/ken/data/score.csv")
head(score,2)

#id,class를 제외한 수학,영어,과학의 평균 점수를 구하시오
apply(score[,c(3,4,5)],2,mean)


# sd = 표준편차
apply(score[,c(3,4,5)],2,sd)




##############산술연산#############



###[Q] 2nd edtion p56#####

getwd
setwd("c:/ken/data/")



name<-c("kim","lee","park")
age<-c(20,21,23)
address<-c("seoul","degu","busan")

mode(name)
mode(age)
mode(address)

is.character(name)
is.character(age)
is.character(address)

is.numeric(name)
is.numeric(age)
is.numeric(address)


str(women)

plot(women)


A<-c(1:100)
mean(A)


x<-c(1,3,5,7)
y<-c(3,5)
union(x,y) #x와 y의 합집합

setdiff(x,y) #x에는 있는데, y에는 없는 값

#[Q p65]

x1<-c(1,2,3,4,5)
x2<-c(3,4,6,8,10)
x3<-c(3,6,9,12,15)

x1<-c(5,40,50:52)
x2<-c(30,5,6:8)
x3<-c(20,6,9:12)

cb<-cbind(x1,x2)
cb


getwd()


txtemp<-readLines("c:/ken/data/data3/emp.txt")

txtemp<-read.table("c:/ken/data/data3/emp.txt", header = 1, sep =  "")
txtemp

csvtemp<-read.csv("c:/ken/data/data3/emp.csv", header = T)
csvtemp

help(read.csv)
name<-c("사번","이름","급여")
read.csv("c:/ken/data/data3/emp2.csv", header = F, col.names = name)


df<-data.frame(x = c(1:5),y = seq(2,10,2),z = c('a','b','c','d','e'))
df

df$x


# lm(종속변수=독립변수+가성비+양,data=women)
head(women,2)
women.lm <- lm(weight ~ height, data = women)
plot(women)
abline(women.lm, col="red") #색상변경경

summary(women.lm)

height<-data.frame(id=c(1,2),h=c(180,175))
weight<-data.frame(id=c(1,2),w=c(80,75))

user<-merge(height,weight,by.x="id",by.y = "id")
user


################# iris 필드명을 모두 소문자로 변경

names(iris) <- tolower(names(iris))
 iris

#################
 
num<-list(c(1:5),c(6,10))
num

member<-list(name=c("홍길동","유관순"),age = c(35,25),
             address = c("한양","충남"), gender = c("남자","여자"),
             htype = c("아파트","오피스텔"))
member

member$age[1]<-45
member$id <- "hong"
member$pwd <- "1234"
member

member$age <- NULL
member

length(member)

mode(member); class(member)


#########################[Q p90]
#1
Vec1<-rep("R",5)
Vec1

Vec2<-seq(1,10,by=3)
Vec2

Vec3<-rep(seq(1,10,by=3),each=3)
Vec3

Vec4<-c(Vec2,Vec3)
Vec4

Vec5<-seq(15,25, by =5)
Vec5

Vec5<-Vec4[seq(1,16, by = 2)]
Vec5


###??

#2
name<-c("최민수","유관순","이순신","김유신","홍길동")
age<-c(55,45,53,15)
gender<-c(1,2,1,1,1)
job<-c("연예인","주부","군인","직장인","학생")
sat<-c(3,4,2,5,5)
grade<-c("C","C","A","D","D")
total<-c(44.4,28.5,43.5,NA,27.1)

user<-c(name,age,gender,job,sat,grade,total)

hist(gender)

user2<-user[seq(2,4, by = 2)]
user2



#3
kor<-c(90,85,90)
eng<-c(70,85,75)
mat<-c(86,92,88)

df<-c(kor,eng,mat)

apply(df,2,max)
apply(df,1,max)


set.seed(1)
Vec1<-round(rnorm(100,80,5),2)
Vec1

round(apply(df, 2,mean),2)



#4
%>% Data2<-c("2017-02-05 수입 3000원",
         "2017-02-06 수입 4500원",
         "2017-02-07 수입 2500원")


library(stringr)




############################그래프

library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy))
head(mpg,2)

library(dplyr)
distinct(mpg,fl) #중복없이 종류류

#배경에 산점도 추가하기
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()


# 축 범위를 조정하는 설정 추가
#x축 범위 3~6으로 지정, y푹 범위 10~30 으로 지정

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6) + ylim(10,30)

#qplot = 전처리 단계 데이터 확인용 문법 간단, 기능 단순
#ggplot = 최종 보고용, 색 크기, 폰트 등 세부 조작 가능


#Q1
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point() + xlim(cty) + ylim(hwy)

#Q2

ggplot(data = midwest, aes(x = poptotal, y = popasian)) +
         geom_point() +
         xlim(0,500000) +
         ylim(0,10000)
options(scipen = gg)

###막대그래프(집단 간 차이 표현하기)

# 막대그래프(bar chart): 데이터의 크기를 막대의 길이로 표현한 그래프
#성별 소득 차이 처럼 집단간의 차이를 표현하기 위한 그래프

#집단별 평균표 만들기

library(dplyr)

df_mpg<-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg

#막대그래프 생성하기
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

#크기 순으로 정렬하기
ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) + geom_col()


#geom_col / geom_bar
#평균막대 그래프(geom_col): 데이터를 요약한 평균표를 먼저 만든 후 평균표를 이용해 그래프 생성
#빈도막대 그래프(geom_bar):별도로 표를 만들지 않고 원자료를 이용해 바로 그래프 생성


#막대그래프2 -  빈도 막대 그래프
#값의 개수(빈도)로 표현한 그래프



#x축 범주 변수, y축 빈도
ggplot(data = mpg, aes(x = drv)) + geom_col()

#x축 연속변수, y축 빈도
ggplot(data = mpg, aes(x = hwy)) + geom_bar()


#mpg 데이터를 이용해서 분석문제를 해결 해보세요


#Q1 어떤호사에서 생산한 "suv" 차종의 도시연비가 높은지 알아보려고 합니다. "suv" 차종을 대상으로 평균 cty(도시연비)가
#가장높은 회사 다섯곳을 막대그래프로 표현해 보세요. 막대는 연비가 높은 순서대로 정렬


df_mpg<- mpg %>% 
  filter(class=="suv") %>%
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

df_mpg

ggplot(df_mpg, aes(x = reorder(manufacturer, -mean_cty),
       y = mean_cty))+ geom_col()



#Q2 자동차 중에서 어떤 class(자동차 종)가 가장 많은지 알아보려고 합니다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요




#시계열 그래프 만들기(주가, 활율등에 많이 사용)
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line() #unemploy - 실업자수

ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()+
  geom_abline()
a<-lm(psavert~date, date = economics)
a




#economics 데이터를 이용해서 분석 문제를 해결해 보세요

#Q1 psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다
#시간에 따른 개인 저출률의 변화를 나타낸 시계열 그래프를 만들어 보세요


economics

ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()



#누적그래프
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))


###########

