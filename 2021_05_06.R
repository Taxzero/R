rm(list = ls())

#왜도/첨도 360~361

#왜도: 분포의 모양이 대표값을 중심으로 좌우에 모양이 대칭인가를 측정
#데이터의 치우침정도
#왜도가 0에 가까운값 = 좌우대칭
#왜도가 0보다 작은 음수 = 오른쪽으로 치우쳐 왼쪽 꼬리가 길게
#왜도가 0보다 큰 양수 = 왼쪽으로 치우쳐 오른쪽으로 꼬리가 길다

#첨도: 대표값을 중심으로 얼마나 모였는가
#첨도 >3 또는 0 가운데 뾰족한 모양
#첨도=3 또는 0
#첨도<3 또는 0 좌우로 퍼져 완만한 모양

library(readxl)
dustdata <- read_excel("c:/ken/data/localAverage.xlsx")
View(dustdata)


str(dustdata)

dustdata %>% filter(is.na(area))
dustdata %>% filter(!is.na(area))

dustdata1 <- subset(dustdata, !is.na(area), c(area,finedust)) 
dustdata1


library(dplyr)
dustdata_anal<-dustdata %>% filter(area %in% c("성북구","중구"))
View(dustdata_anal)

count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))

dust_anal_area_sb <- subset(dustdata_anal, area == "성북구")
dust_anal_area_jg <- subset(dustdata_anal, area == "중구")

dust_anal_area_sb
dust_anal_area_jg

install.packages("psych")
library(psych)

describe(dust_anal_area_sb$finedust)
describe(dust_anal_area_jg$finedust)


boxplot(dust_anal_area_sb$finedust,dust_anal_area_jg$finedust,
        main = "finedust_compare", xlab = "AREA", names = c("성북구","중구"),
        ylab = "FINEDUST_PM", col = c("blue","green"))



 t.test(data = dustdata_anal, finedust ~area, val.equal = T)


 
#############################################################################
#일 표본 t 검정
 
#과자의 50g인지 확인을 위해 50봉지를 구매해 각각의 무게를 재고 평균을 구한것
#==표본 평균
 
#실제 과자 봉지의 평균과 비교(모집단의 알려진 평균)
m=50 #알려진 모집단의 평균
sa_1 <- rnorm(50,58,3) #표본을 뽑는다.

#상자 그림
boxplot(sa_1)
 
#정규성 검사 
shapiro.test(sa_1)

t.test(sa_1, mu=m, val.equal = T)
#모집단과 표본의 평균이같다
#모집단과 표본의 평균이 다른다

#
t.test(sa_1, mu=m, alternative = "less", var.equal = T) #단측검점점


###############################################

#"two.sided"(같은지)를 구분하는 명령어
#중간고사 이후 과외를 받은 10명의 학생의 중간고사 -기말
#데이터를 가상으로 만들어서 비교


#30개 이하임을 확인
mid = c(16,20,21,22,23,22,27,25,27,28)
final = c(19,22,24,24,25,25,26,26,28,32) 
 
#정규성 확인
shapiro.test(mid) 
shapiro.test(final) 
 
#0.05보다 크므로 30개 이하이지만 정규성을 끤다
#정규성을 가진다.

#귀무가설: 평균이 차이가 없다.
#대립가설: 평균이 차이가 있다.

#과외후 차이가 있는지 비교
#기말고사 - 중간고사

#mid와 final두개가 평균이 같은지
t.test(final,mid, paired = T, var.equal = T) #0.2287

####################
rm(list = ls())

x<-c(0,1,4,9)
y<-c(0,5,7,9)
mean(x) 
mean(y)

cor(x,y,method = "pearson")

#####################################3
data("mtcars")
head(mtcars)
install.packages("corrplot")
library(corrplot)
car_cor <-cor(mtcars)
car_cor
round(car_cor,2) #소수 둘째자리

corrplot(car_cor)
#음의 관계 빨간색 양의 관계 파란색
str(car_cor)
summary(car_cor)

#귀무가설: 담배값 인상과 흡연과 차이가 있다
#대립가설: 담배값 인상과 흡연과 차이가 있다.

x1<-c(70,72,62,64,71,67,0,65,74,72)
y1<-c(70,74,65,68,7,74,61,65,67,75)
xy_1<-data.frame(x1,y1)
#############

#담배인상 전후 차이가 있다 없다>?
t.test(y1,x1,paired = T, var.equal = T, data=xy_1)

#####################3

#이원카이제곱 검정
#독립성검정(관련성검정)
#HO: 기대치와 관찰자는 차이가 없다.
#H1: 기대치와 관찰자는 차이가 있다.
#독립변수(x)=설명변수, 종속변수(y)=반응변수 생성


install.packages("gmodels")
library(gmodels)


data<-read.csv("c:/ken/data/cleanDescriptive.csv", header = TRUE)
data

x<-data$level2 #부모의 학력수준
y<-data$pass2 #자녀의 대학진학여부

a1<-data.frame(x,y)
head(a1)
cross #어쩌구 못했다.

##################

# 가메 p417
# 양측검정 =  우리가 알고있는 가설
# 귀무가설: 모집단과 표본 평균이같다
# 대립가설 :모집단과 표본 평균이 다른다.
# 
# 단측검정 (다르지만 큰 치수)
# 대립가설: 모집단과 표본 평균이 다르다
# 
# 또는(다르지만 작은 치수)
# 대립가설: 모집단과 표본 평균이 작다.
# 
# 등분산, 이분산p429
# 등분산: 모집단에서 추출된 표본이 균등하게 추출
# 이분산: 추출된 표본이 특정 계측으로 편중되어 추출
# vactsest(a1,a2)


# 모수(정규분포): 관측 값이 어느 특정한 확률분포를 따른다고 전제
# 비모수(비정규분포): 관측값이 어느 특정 확률 분포를 따른다고 전제 할 수 없을떄
# 카이제곱 검정 p394 가메
# :범주별로 관측빈도와 기대 빈도와의 차이를 통해서 확률 모형이 얼마나 잘 설명하는지를 설명
# 
# p396
# HO: 기대치와 관찰잔ㄴ 차이가 없다.
# H1: 기대치와 관찰자는 차이가 있다.
# chisq.tset(4,6,17,16,8,9)0uj
# 
# t검정구분
# -일 표본 t검정 #5_6차이 검정
# 평균이 같은지 여부
# mu=50
# -독립표본 t검정 가메 p417
# 두그룹간의 차이를 비교 - 률 분산이 같은지 확인
# var.equal = TRUE
# 대응표본 가메 p431
# 쌍으로 묶어서 차이만 계산
# 검증 차이값을 하나로
# paired = TRUE
# 
# 회귀방정식 가메 p477
# 단순회귀
# 다중회귀