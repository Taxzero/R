####################[오전정리]############################3
rm(list = ls())

iris
?iris #help

str(iris) #데이터 속성

head(iris)
head(iris,5)
tail(iris)
tail(iris,5)

#iris 데이터의 1행부터 5행의 위에서 6개 데이터만 가져오세요

head(iris[c(1,5),],6)


#iris 데이터의 1열부터 5열의 위에서 6개 데이터만 가져오세요

head(iris[,c(1,5)],6)


#파이프연산자 ctlr +shipt + M
#library(dplyr) 사용해야 파이프연산자 사용가능
library(dplyr)

iris %>% select(c(3:4)) %>% head(10)

ls(iris)

head(iris[,-5],10)
# =
iris %>% select(-Species) %>% head(10)

#iris데이터에서 Sepal.Length의 평균을 구하여라

mean(iris$Sepal.Length)

#평균 중위값 분산 표준편차 기본통계등 다 보고싶으면 
summary(iris$Sepal.Length)

#표준편차
sd(iris$Sepal.Length)

#중위값
median(iris$Sepal.Length)

#데이터의 열방향 최댓값
apply(iris,2,max)

#데이터의 열방향 최소값
apply(iris,2,min)

#합계와 평균의 경우 Species값을 제외하고 구한다.
#iris데이터의 열방향 합계
apply(iris[,1:4],2,sum)
apply(iris[-5],2,sum)

#iris데이터의 열방향 평균
apply(iris[,1:4],2,mean)

#Species붓꽃 종의 집계
table(iris)

?subset

df.set <- subset(iris, Species == "setosa")
head(df.set)
summary(df.set)


#petal.length 4.35초과이고 Petal.Width 1.3 초과인 데이터를 df.large로 저장

df.large <- subset(iris, Petal.Length > 4.35 & Petal.Width > 1.3)
df.large

table(df.large[,5])
plot(iris)
plot(df.large)
pairs(df.large[df.large$Species=="virginica"])
install.packages("psych")
library(psych)
pairs.panels(iris)
############비교
library(dplyr)
distinct(iris,Species)

plot(iris)
plot(iris$Sepal.Width)

###가메 히스토그램 시각화 p150
#히스트그램의 속성
#xlab x축의 이름 #ylab y축의 이름
#main 제목
#col 컬러

data(iris)
names(iris)

str(iris)
head(iris)

summary(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab = "iris$Sepal.Length",col = "blue",
     main = "iris 꽃받침 길이 Histogram", xlim = c(4.3,7.9))

summary(iris$Sepal.Width)
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",col = "orange",
     main = "iris 꽃받침 너비 Histogram", xlim = c(2.0,4.5))

par(mfrow = c(1,2)) #plot 영역에 1행2열의 차트표현현
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",col = "green",
     main = "iris 꽃받침 너비 Histogram:빈도수", xlim = c(2.0,4.5))

hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",col = "mistyrose", freq = F,
     main = "iris 꽃받침 너비 Histogram:확률밀도", xlim = c(2.0,4.5))

lines(density(iris$Sepal.Width),col = "red")

par(mfrow = c(1,1))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",col = "mistyrose", freq = F,
     main = "iris 꽃받침 너비 Histogram", xlim = c(2.0,4.5))

x <-seq(2.0,4.5,0.1)
curve(dnorm(x,mean = mean(iris$Sepal.Width), sd = sd(iris$Sepal.Width)),
            col = "blue",add = T)

###########################################################

head(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)

library(reshape2)
melt_test <- melt(airquality)
head(melt_test)

tail(melt_test)

melt_test2 <- melt(airquality, id.vars = c("month","wind"), measure.vars = "ozone")
head(melt_test2)

names(airquality) <- tolower(names(airquality))
head(airquality)

aq_melt <- melt(airquality, id = c("month","day"), na.rm = TRUE)
head(aq_melt)


aq_dcast <-dcast(aq_melt, month+day ~ variable)
head(aq_dcast)

acast(aq_melt, day~ month~ variable)

acast(aq_melt, month~ variable, mean)


##########################################3
#온도의 합계를 구하시오 (단, 결측치 제외)
View(airquality)

sum(airquality$wind)

#airquality 데이터중 NA가 한개라도 있으면 제외하고
NA.RM_AIR 

air_low <- airquality
head(air_low)

names(air_low) <- tolower(names(air_low))
head(air_low)
dim(air_low)

is.na(air_low)  #결측
table(is.na(air_low))

air_narm <- na.omit((air_low))
str(air_narm)
table(air_narm)

melt_test2 <- melt(air_narm, id.vars = c("month","wind"), measure.vars = "ozone")
head(melt_test2)

head(melt_test2)
View(melt_test2)


#실습문제1
#월일을 기준으로한 Only solor.r 값을 확인
#rm(melt_test4)

acast(airquality)
##############################################

dim(air_low)
head(air_low)

dim(air_narm)
head(air_narm)


aq_melt <-melt(air_low, id.vars = c("month","day"),
               na.rm = TRUE)

dim(aq_melt)
View(aq_melt)

aq_dcst <- dcast(aq_melt, month + day ~variable)
aq_dcst

dim(aq_dcst)
head(aq_dcst)
View(aq_dcst)

#dcast 대소문과 기준열을 제외한 기존 airquality와 같은 데이터

#acast() 함수 활용허가 p175
#acast(데이터세트, 기준열 ~변환영~분리기준열)
View(aq_melt)

#5월부터 9월/1일 1일에서 30까지 오존,태양복사, 바람 온도의 측정값

acast(aq_melt, day~month~variable) #기준2개

#평균으로 요약하기
acast(aq_melt, month ~ variable, mean) #기준 1개

#sum으로 요약하기
acast(aq_melt, month ~ variable, sum)

#####################################################







############################[기초통계]#############################
#고등학교 2학년 남학생의 키 분포도를 통해 기초 통계량을 구하시오

height <- c(164,166,168,170,172,174,176)

#편차 (변량-평균)

mean(height)
#170

164-170 
166-170
168-170
170-170
172-170
174-170
176-170

#편차의 제곱

#분산
var(height)

#분산에 루트를 씌우면 표준편차
sd(height)

summary(height)
dev.new()
boxplot(height)

################################################################

#정규성 여부 판단.
#p < 0.05보다 커야 정규성이다.


hist(height)

shapiro.test(rnorm(100,5,3))

?ToothGrowth
data(ToothGrowth)
dim(ToothGrowth)
str(ToothGrowth)
shapiro.test(ToothGrowth$len)
hist(ToothGrowth$len)

data1 <- sample(50:100,100,replace = T)
hist(data1, col = "orange", las = 1)
shapiro.test(data1)

data2 <- morm(100:82,2)


#####################3

install.packages("reshape2")
library(reshape2)

data<- read.csv("c:/ken/data/data3/data.csv")
data

wide <-dcast(data, Customer_ID ~ Date, sum)
wide

setwd("c:/ken/data/data3")
write.csv(wide,"wide.csv",row.names = FALSE)

wide <- read.csv("wide.csv")
colnames(wide) <- c('Customer_ID','day1','day2','day3','day4',
                    'day5','day6','day7')

wide

long <- melt(wide, id = "Customer_ID")
long

name <-c("Customer_ID","Date","Buy")
colnames(long)<-name
head(long)

data("smiths")
smiths

long <- melt(id = 1:2, smiths)
long

dcast(long,subject + time~...)

data('airquality')
str(airquality)
airquality

names(airquality) <- toupper(names(airquality))
head(airquality)

air_melt <- melt(airquality, id = c("MONTH","DAY"),na.rm = TRUE)
head(air_melt)

names(air_melt) <- tolower(names(air_melt))
acast <- acast(air_melt, day~ month~ variable)
acast

class(acast)

acast(air_melt, month~ variable, sum, margins = TRUE)

#####연습문제
library(dplyr)

data(iris)

iris %>% filter(Petal.Length >= 1.5)

iris %>% filter(Petal.Length >= 1.5) %>% select(1,3,5)

iris %>% filter(Petal.Length >= 1.5) %>% select(1,3,5) %>% 
  mutate(diff = Sepal.Length - Petal.Length)

iris %>% filter(Petal.Length >= 1.5) %>% select(1,3,5) %>% 
  mutate(diff = Sepal.Length - Petal.Length) %>% 
  group_by(Species) %>% summarise(mean_S = mean(Sepal.Length),mean_P = mean(Petal.Length))

library(reshape2)

melt(iris,"Species")

dcast(iris,Species~variable,sum)




# 기술 통계학/추측통계학
# 
# 기술통계학: 모집단으로부터 표본을 추출하고 나서 표본이 가지고 있는 정보를 쉽게 파악할 수 있도록 데이터를 정리하거나 요약 숫자로 또는 그래프의 형태로 표현하는 절차를 다루는 분야
# 
# 추측통계학: 모집단으로부터 추출한 표본의 표본 통계량으로 부터 모집단의 특성인 모수에 관해 통계적으로 추론하는 절차를 다루는 분야
# 
# 전수조사
# -인구조사
# -대입 수학능력시험 성적채점
# -차량의 안정성 조사
# -통계청에서 매월발표하는 실업률 조사
# -정기적으로 실시하는 A고등학교 학생들의 신체검사
# 
# 표본조사
# -대한민국 중학교 3학년 수학점수를 알고 싶으나 시간과 비용면을 고려하여 한국경제중학교 2반 학생들을 표본으로 test를 하는 경우
# //////////////////
#   
#   범위(RANGE)=최댓값-최솟값
# 사분위수 편차 =(Q3-Q1)/2
# 분산:산포도의척도로 가장 널리사용
# -분산계산시
# *데이터가 모집단 전체일 경우 데이터의 수 n개로 나누고
# *표본일 경우 (n-1)로 나눈다.(데이터의 표본의 크기가 큰 경우는 큰차이가 없다.)
# 
# 왜도: 분포의 모양이 대푯값을 중심으로 좌우의 모양이 대칭인가를 측정
# -데이터의 치우침 정도(한방향)
# -왜도가0에 가까운 값 = 좌우대칭
# -왜도가 0보다 적은 음수 = 오른쪽에 치우펴 왼쪽 꼬리가 길게
# -왜도가 0보다 큰 양수 = 왼쪽으로 치우쳐 오른쪽 꼬리가 길다
# 
# 첨도:첨도는 분포가 대푯값을 중심으로 얼마나 모여 있는가를 나타내는 척도인데 나중에 설명할 정규분포(첨도=3)을 기준으로 비교-첨도 >3 가운데 뾰족한 모양
# -첨도 = 3
# -첨도 < 0 좌우로 퍼져 완만한 모양
# 
# 자료의 구분과 변수설정
# 양적자료
# 이산자료: 수지 성질로 인해 정수유형
# 연속자료
# 
# 
# 편차: 각 데이터값 = 평균
# 분산:변량들이 퍼져있는 정도, 분산이 크면 불안정
# 표준편차: 분산은 수치가 너무 커서 제곱근을 이용하며 줄인값
# 최빈값: 최빈수라고도 하며 데이터에서 가장 자주 나타나는 숫자
# 
# 
# 세상의 모든 데이터는 정규분포를 따른다.(모든 가설의 원리)
# 데이터셋이 정규분포를 따른다.
# 다양한 분석이론에 적용시킬 수 있다.
# 만약 정규분포에 따르지 않는다면 데이터 먼징하거나 비모수적 방법을 사용한다. wilcoxtest( ), morm(100,85,3)
# 
# 중심극한의 정리(CLT)
# Centerl Limit Theorem
# -표본의 평균은 표본의 크기가 커질수록 정규분포에 가까워진다.
# -모집단이 정규분포하지 않더라도 표본의 크기가 충분히 크다면 정규분포라고 한다
# 
# 대수의 법칙
# 다음 법칙은 표본이 n >=30인 경우 정규분포를 따른다
# -표본의 크기가 증가할수록 통계적 추정의 정밀도가 향상된다는 것을 수학적으로 증명
# -표본의 크기가 커짐에 따라 표본에서 계산한 평균값과 보집단의 실제 평균과의 차이가 매우 작아진다.
# -??ToothGrowth
# 
# 
# Shapiro 샤피로 검정
# 
# Shapiro 샤피로 검정으로 정규성을 띄는지 여부 확인 0.05보다 크면 귀무가설 채택 정규성을 띈다.
# 귀무가설 정규성을 따른다. (p값>0.05)
# 대립가설 정규성을 따르지 않는다.(p값<0.05)

















































































