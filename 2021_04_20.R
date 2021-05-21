A<-c(1,4,5,"B")
class(A)
as_A<-as.character(A)
class(as_A)

rm(A)
rm(list=ls())

ls() #변수 목록 알려준다

install.packages("ggplot2") #시각화 패키지지
library(ggplot2)

#경고 메세지는 무시하자

search()  #설치된 패키지 확인

#remove.packages("ggplot2",dependencies=T) #패키지 삭제

dir() #파일 목록 확인
ls()
getwd()

#setwd("c:/") #setwd("c:\\") #디렉토리 설정 1)파일 탐색기로 열기 2)setwd()사용
#tab사용시 파일 목록 보여준다

#한번에 주석처리 ctrl + shift + C

.libPaths() #R 라이브러리 어디에 설치되어 있는가?

# 어제 복습
increase_num <- seq(3,10,by=2)
increase_num
plot(increse_num)

times_num<-rep(c("a","b"), times=2)
times_num
times_num_each<-rep(c("a","b"), each=2)
times_num_each

nums=c(1,2,3,4,5,6)
nums[-3]
nums
nums[-1:-3]
nums[-c(1,4)]

nums_cha<-as.character(nums) #꼭 <-해서 넣어주기
class(nums_cha)

nums
sum(nums) #합

#1부터 10까지 중복되는 데이터를 임의로 5개 추출

sample(1:10,5)

#sort() 오름차순
#sort( , decreasing = T) 내림차순

#데이터 준비하기
#exam<-read.csv("data/csv")

name<-c("김지훈","이유진","박동현","김민지")
eng<-c(90,80,60,70)
math<-c(50,60,100,20)
table<-data.frame(name,eng,math)

str(table)



table$name
table$eng
table$math

############엑셀불러오기
install.packages("readxl")
library(readxl)

excel_ex <- read_excel("c:/rcode/data/1.xlsx")
excel_ex

#여러개의 문서를 불러오려면.

#sheet = 

excel_ex2 <- read_excel("c:/rcode/data/1.xlsx",sheet = 2)
excel_ex2

excel_ex3 <- read_excel("c:/rcode/data/1.xlsx",sheet = 3)
excel_ex3


###행렬생성하기
x<-c(1,2,3,4,5,6)
matrix(x, nrow = 2, ncol = 3)
matrix(x,nrow=3,ncol = 2)

#열기준으로 cbind라고 한다.아무런 조건이 없다면 N 자 순으로 표가생김.

#byrow 행기준 Z 자 순으로 표가 생김
x<-c(1,2,3,4,5,6)
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 2, ncol = 3, byrow = T)

###배열생성하기
y<-c(1,2,3,4,5,6)
array(y,dim=c(2,2,3))

###리스트생성하기
list1<-list(c(1,2,3),"Hello")
list1

list1[[1]] #첫번째만 프린트

list1[[1]][3] #첫번째 숫자중 3번째 숫자만프린트

list1[[2]] #두번째 문자

#Q
a<-1:10
b<-matrix(a,ncol = 2)
b
c<-data.frame(a,b=11:20)
d<-list(a,b,c)
d

###Q p77 연습문제 4,5번문제
ID<-c(1,2,3,4,5)
MID_EXAM<-c(10,25,100,75,30)
class1<-c("1반","2반","3반")
class2<-c("1반","2반")

example_test<-data.frame(ID,MID_EXAM,class1,class2)


###

df_midterml<-data.frame(english=c(90,80,60,70),
                        math1=c(50,60,100,20),
                        class1=c(1,1,2,2))
df_midterml

#특정 행/열 더하기
apply(df_midterml,1,sum) #행(숫자1은 행을 의미) 328 krdi
apply(df_midterml,2,sum) #열(숫자2는 열을 의미)


#기준열을 통한 합산
aggregate(math1~class1,data=df_midterml,sum) #학급별 수학점수 평균을 구하여라
aggregate(english~class1,data=df_midterml,sum) #학급별 영어점수 평균을 구하여라
aggregate(.~class1,data=df_midterml,sum)


#### 샘플링을 할떄 데이터가 없을떄 만드는 법

rnorm(100,80,5) #평균값을 구할때 (총/갯수/편차)

#소수점을 지우려면 round

round(rnorm(100,80,5))

round(rnorm(100,80,5),0) #정수로 표현할때

#csv파일로 저장하는 법
rnorm_DB<-round(rnorm(100,80,5),0)
write.csv(rnorm_DB,"data/rnorm_DB.csv")

rnorm_DB<-round(rnorm(100,80,5),0)#불필요한 열 지울때
write.csv(rnorm_DB,"data/rnorm_DB.csv", row.names=F)

K1<- c(5,40,50:52) #cbind 기본 아래방향
k2<- c(30,5,6:8) #rbind 오른쪽방향
mc <-c(k1,k2)

###################

############################

rnorm_DB<-round(rnorm(100,80,5),0)
dev.new()
hist(rnorm_DB)


##############################

#백터변환
rm(list=ls())
#백터생성
fe_test<-factor(c("C","B","A"))
str(fe_test) #문자
fe.factor<-factor(fe_test)


a<-factor(fe.factor,levels=c("C","B","A"))


str(a) #속성확인
is.factor(fe.factor) #백터인지 체크
as.numeric(fe.factor) #강제로 숫자로변경
as.character(fe.factor)#강제로 문자로 변경

##########################


####### R에 기본적으로 내장되어있는 데이터

data(iris) 
head(iris)
str(iris)

##########
################################################
#TEST
#1번문제
v1<-c(1,2,3,4,5,6,7,8,9,10)
v2<-c(v1*2)
max_v<-max(v2)
max_v
min_v<-min(v2)
min_v
avg_v<-mean(v2)
avg_v
sum_v<-sum(v2)
sum_v
v3<-v2[-c(5)]
v3
#2번문제
v4<-seq(1,10,by=2)
v4
v5<-rep(1,time=4)
v5
v6<-rep(c(1,2,3),times=3)
v6
v7<-rep(c(1,2,3,4),each=2)
v7
v8<-rep(c("a","B"),each=2)
v8
#3번문제
sample(1:100,10)
sort(1:100)
sort(1:100,decreasing = T)

#4번문제
v9<-seq(1,10, by=2)
v9

#5번문제
score1<-c(1:20,5)
friends<-factor(c("둘리","또치","도우너","희동","듀크"))


###############################어려움 나중에 다시한번 해보자.
