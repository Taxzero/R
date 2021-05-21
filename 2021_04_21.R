
##########예제############
#rnorm() 50개의 평균 75 편차 3 rnorm_2저장
#rnorm() 50개의 평균 75 편차 15 rnorm_15저장

rnorm_3<-rnorm(50,75,3)
rnorm_15<-rnorm(50,75,15)

#########################################################

#par(mfrow=c(행의수,열의수)) 한화면에 다수의 그래프 출력
par(mfrow=c(1,2))
plot(rnorm_3) #plot = 점의 산포도 시각화화
hist(rnorm_15) #hist = 그래프



###비교연산자###

#크거나 같다(이상) * >= *
#작거나 같다(이하) * <= *
#크다(초과) * > *
#작다(미만) * < *
#R에서 같지 않다 * != *
#엑셀 <>

###########################################################

##어제 문제 복습

#문제3
nums<-sample(1:100,5)

#1 50보다 큰 원소들의 값
nums[which(nums>=50)] #위치 번째를 찾아 원소 값 대입

#2 최대 원소값의 인덱스를 출력하라

#3 최대값
which.max(nums)

#4 최소값
which.min(nums)

#5 오름차수
sort(nums)

#6 내림차수
sort(nums.decreasing=T)

#7 nums 항목명의 이름 정의
names(nums)<-c("A","B","C","D","E")
nums

nums(X) # x가 들어가는 것은 임의의 변수

#문제5
score1<-sample(1:20,5)
#1
Friends<-c("둘리","또치","도우너","희동","듀크")
#2
#paste(score1,Friends,seq="")
Friends[which.max(score1)]
Friends[which.min(score1)]
Friends[which(score1>10)]


#########################

exam <- read.csv("c:/rcode/data/csv_exam.csv")
exam

#index:데이터의 위치 또는 순서를 의미하는 값
#indexing:인덱스를 이용해 데이터를 추출하는 작업

exam[1,] #1행을 가져오는 법
exam[,1] #1열을 가져오는 법

######################

#####조건을 충족하는 행 추출하기#####

exam[exam$class == 1,] #class가 1인 행 추출

exam[exam$math >= 80,] #math가 80점 이상인 행 추출

#1반이면서 50점 이상
exam[exam$class == 1 & exam$math >= 50,] # & = and

#영어점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english < 90 | exam$science < 50,] # | = 버티컬 바 (shipt+\) = or


###Q1 data.frame()과 c()를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력
#데이터 세트 이름 sales
#0421_R 저장

fruit<-c("사과","딸기","수박")
price<-c(1800,1500,3000)
volum<-c(24,38,13)
sales<-data.frame(fruit,price,volum)
sales

#or

df_midterml<-data.frame(fruit=c("사과","딸기","수박"),price=c(1800,1500,3000),voulum=c(24,38,13))
df_midterml


#Q2 앞에서 만든 데이터 프레임을 이용하여 과일 가격 평균, 판매량 평균을 구하기




###########################################

var5<-c(1,3,5,7,9)

10 %in% var5   #필터 대신 쓰기도 함
#FALSE
7 %in% var5
#TRUE


###########################################

paste(1,2,3,4) #(붙여넣기)
paste(1,2,3,4, sep="") #sep=구분하는 것
paste(1,2,3,4, sep="    ") # "-" 스페이스바 합치기

#Q[1] paste('문자열을','합쳐','주세요', sep="") # 공백으로 구분하기(공백입력)
paste("문자열을","합쳐","주세요", sep=" ")

#Q[2] "c1" "c2" "c3"...."c10"
paste("c1",1:10)
paste0("c1",1:10) #문자와 숫자사이의 공백을 없애고 싶다면 paste 뒤에 숫자 0을 입력

#Q[3]A1~A3, B1~B3, C1~C3인 자료를 만들어라
#ex) "A1" "A2"........"C3"
c(paste0("A",1:3),paste0("B",1:3),paste0("C",1:3))

########################################

###리스트(list)#

a<-c(1,3)
b<-c(1,4)
a
b

c<-data.frame(a,b) :c #이렇게 하면 길이가 다르기 떄문에 에러 발생
c

d<-list(a,b) :d #길이가 상관없는 list이기 때문에 가능
d

###list 보강###

# a<-1:3
# b<-"a string"
# c<-pi
# d<-list(-1,-5)
#data.frame에 삽입



ken<-data.frame(a,b,c,d) :ken

ken_list<-list(a=1:3,
               b="a string",
               c= pi,
               d=list(-1,-5))

ken_list #consol에 값이 출력되었을때 $가 붙어있을 경우 list로 만든 것

###############################



#리스트 (list) 함수와 [] 대괄호를 이용하여 부분함수 만들기



#######행뽑기

ken_list[[1]]
ken_list[[2]]
ken_list[[3]]
ken_list[[4]]

ken_list[[4]][1]
ken_list[[4]][2]


######### matrix 추가 법

mt<-matrix(1:6,2,3) #
mt

mt+3 # + 하면 각각의 행렬값에 더해서 출력


########################################################################


#행렬생성방법 - matrix(data=백터, nrow=행의갯수, ncol=열의갯수)
#             -matrix(data=백터,nrow=행의갯수, ncol=열의갯수, byrow=TRUE)
#             -rbind(백터들....), cbind(백터들.....)
#dim(m)-행렬이 몇차원인지체크, nrow(행렬), ncol(행렬)
#colnames(m), rownames(m), rowsum(m), colsum(m), rowmeans(m), colmeans(m)


########################################################################

rowsum(mt)   #행의 합
colSum(mt)   #열의 합
rowMeans(mt) #행의 평균
colMeans(mt) #열의 평균

mt

#열기준 / cbind / apply  1or2(열)
#apply(데이터,1,함수)
#apply(데이터,2,함수)


###########

t(mt) #t() = transpose 행과 열 바꿈

#############

y<-c(1:6)
array(y,dim=c(2,2,3))


############내장 데이터 세트iris

# 궁금한 함수등은 ?? 두개를 사용하여 출력 (오른쪽 help창에 출려됨)
??iris
??mtcars

#r에 기본적으로 저장되어있는 정보를 불러올때에는
#일반적으로 그냥 타이핑(ex- iris), data(-), attach(-) / dettach(-)= attach의 반대로 불러온 정보를 지우는 것

iris
data(iris)
attach(iris)

###################################################

head(iris,3) #위에 3개만 보고 싶은 경우 head(-,3)
tail(iris,3) #아래에서 3개만 보고 싶은 경우 tail(-,3)
dim(iris)  #행 * 열
nrow(iris) #행의 개수
ls(iris)   #iris 변수목록

##################################################

my_iris<-my_iris[,1:4] :my_iris
apply(my_iris,2,mean)
apply(my_iris,2,sum)
laply(my_iris,mean)

#view(-) 엑셀처럼 보고 싶을떄 사용

#p100##################

5>3
5>=6
5<3
5<=5
5==5
5!=5

#p101###############

x<-1:3
y<-3:1
x
y
(x>0) & (y>1)
(x>0) | (y>1)

###########################
#mini test p103,p104,p105,p106
install.packages("readxl")
library(readxl)
exdata1<-read_excel("C:/ken/data/Sample1.xlsx")
exdata1

View(exdata1)

str(exdata1)

dim(exdata1)

ls(exdata1)

###################################

install.packages("dplyr") #변수명 변경 패키지
library(dplyr)

exdata1<-rename(exdata1,Y17_AMT = AMT17 , Y16_AMT = AMT16)

#################파생변수 생성하기
#파생변수란 없던 변수를 생성하는 것

exdata1$AMT<-exdata1$Y17_AMT+exdata1$Y16_AMT

exdata1$CNT<-exdata1$Y17_CNT+exdata1$Y16_CNT
View(exdata1)


exdata1$AGE50_YN<-ifelse(exdata1$AGE>=50,"Y","N")
View(exdata1)

exdata1$AGE_GR10<-ifelse(exdata1$AGE>=50,"A1.50++",
                         ifelse(exdata1$AGE>=40,"A2.4049",
                                ifelse(exdata1$AGE>=30,"A3.3039",
                                       ifelse(exdata1$AGE>=20,"A4.2029",
                                              "A5.0019"))))


View(exdata1)

# Q1. 내장함수인 mpg 데이터 세트를 불러오시오
# 
# 1) mpg 데이터세트를 co_mpg 사본으로 저장
# 
# 저장한 co_mpg 데이터 세트를 이용하여 "suv"와 "compact"의 를 추출하시오
# 
# 
# 2)(추출한 각 변수를 co_suv와 co_compact로 저장)
# 
# 
# 3)"suv"와 "compact"의 '도시 및 고속도로 통합 연비' 평균을 구해보세요.


install.packages("ggplot2")
library(ggplot2)
co_mpg<-as.data.frame(ggplot2::mpg) #(as=강제변환환)
co_mpg

View(co_mpg)

co_suv<-co_mpg[co_mpg$class=="suv",]
co_compact<-co_mpg[co_mpg$class=="compact",]

co_mpg$tot <- (co_mpg$cty + co_mpg$hwy)/2

mean(co_compact$tot)
mean(co_suv$tot)



# &  조건을 모두 만족할때 사용
# | 조건이 하나라도 만족하면 사용



summary(co_mpg$co_suv<-(co_mpg$cty+co_mpg$hwy)/2)
summary(co_mpg$co_compact<-(co_mpg$cty+co_mpg$hwy)/2)

hist(co_mpg$tot)
