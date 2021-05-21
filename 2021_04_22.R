#엑셀파일을 csv파일로 변경 후 불러오기

noheader<-read.csv("c:/ken/data/no.csv")

View(noheader)

re_name1<-c("one","two","three","four")
read.csv("c:/ken/data/no.csv",header = F, col.names = re_name1)


getwd() #파일경로



######################
#칼럼명이 없는 파일을 읽어 올때 지정하는 법
# re_name1<-c("lab1","lab2")
# read.csv("no_header.csv",header=F, col.names=re_name1)
#칼럼이 있는 파일을 불러 올 뺴
# read.csv("header.csv")
#칼럼이 있으나 이름을 변경하고 싶을 때
# re_name1<-c("lab1","lab2")
# read.csv("header.csv", col.names=re_name1)
#######################

#비정형 데이터 불러오기

txt1<-readLines("c:/ken/data/구매후기.txt")
txt1

txt2<-readLines("c:/ken/data/구매후기_UTF8.txt") #비정형 데이터라 깨져서 나옴
txt2

#메모장에서 저장할때 인코딩을 ANSI로 저장하면 깨지지 않고 나옴
# 또는 txt2<-readLines("c:/ken/data/구매후기_UTF8.txt", encoding= "UTF-8")을 추가해서 출력

txt2<-readLines("c:/ken/data/구매후기_UTF8.txt", encoding = "UTF-8")
txt2


#테이블 형식이 있는 데이터 불러오기
txt4<-read.table("c:/ken/data/전공.txt",header = T)
txt4

View(txt4)
#
# sep = ":" 를 추가하면 붙어있는 정보를 띄어준다.

txt6<-read.table("c:/ken/data/전공2.txt", header = T, sep = ":")
txt6
View(txt6)
# 학번   이름       전공
# 1 1001 홍길동 컴퓨터공학
# 2 1002 일지매   전자공학
# 3 1003 강감찬   산업공학


#header = T 가 없을 경우 변수가 데이터가 되어 첫번째 행에 임의로 지정이 되어버림
#txt6<-read.table("c:/ken/data/전공2.txt", sep = ":")
#txt6
# V1     V2         V3
# 1 학번   이름       전공
# 2 1001 홍길동 컴퓨터공학
# 3 1002 일지매   전자공학
# 4 1003 강감찬   산업공학

#조건문
data(iris)

df.1<-iris[iris$Species=="setosa",]
head(df.1,3)

df.2<-subset(iris,Species=="setosa")
head(df.2,3)

library(dplyr)
df.3<-filter(iris,Species=="setosa")
head(df.3,3)

#3가지가 모두 같은 결과가 나옴


ex_data<-read.table("c:/ken/data/data_ex.txt")

ex_data<-read.table("c:/ken/data/data_ex.txt", header = T)
View(ex_data)

ex_data<-read.table("c:/ken/data/data_ex.txt",skip=4)
View(ex_data)

ex_data<-read.table("c:/ken/data/data_ex.txt", nrows = 7)
View(ex_data)

##############################################################################
#ifelse조건문= 조건에 따라 프로그램의 흐름을 제어하는 문장
#변수를 지정<-ifelse(비교할 조건문, 참의 값, 거짓의 값) = 간단한 ifelse
#다중 if문
#변수<-ifelse(비교할 조건문,참의값,
#             ifelse(비교할 조건문,참의값,
#               ifelse(비교할 조건문,참의값,
#                 거짓의 값 실행)))


exdata1$AGE_GR10<-ifelse(exdata1$AGE>=50,"A1.50++",
                         ifelse(exdata1$AGE>=40,"A2.4049",
                                ifelse(exdata1$AGE>=30,"A33039",
                                       ifelse(exdata1$AGE>=20,"A4.2029",
                                              "A5.0019"))))




#

var1<-c(1,2,3)
var2<-c(1,2,3)
df<-data.frame(var1,var2)



df$var_mean<-(df$var1+df$var2)/2 #var_mean 의 파생변수 생성

#var_mean 3이상이면 A, 그렇지 않으면 B부여 변수 var_con

var_con<-ifelse(df$var_mean>=3,"A","B")

#var_mean 5이상이면 A, 4이상이면 B, 3이상이면 C, 나머지는 D부여 

var_con<-ifelse(df$var_mean>=5, "A",
                var_con<-ifelse(df$var_mean>=4,"B",
                                var_con<-ifelse(df$var_mean>=3,"C","D")))

var_con
##############################################################################


 #조건이 2개 이상인 경우
 #조건을 모두 만족하는 경우는 &
 #조건을 하개라도 만족하는 경우 |(and)




#Q
#CON이라는 변수를 생성
#total이 25이상이거나 drv가 20 이상이면 "우수", 나머지는 "일반"인 조건을 완성 하여라

mpg
data(mpg)

mpg<-as.data.frame(ggplot2::mpg)

co_mpg<-mpg

head(mpg)

co_suv<-co_mpg[co_mpg$class=="suv",]
co_compact<-co_mpg[co_mpg$class=="compact",]

co_mpg$total <- (co_mpg$cty + co_mpg$hwy)/2

co_mpg$CON<-ifelse(co_mpg$total>=25 & co_mpg$cty>=20,"우수","일반")
co_mpg$CON

View(co_mpg)



mpg$total <- (mpg$cty + mpg$hwy)/2

mpg$CON<-ifelse(mpg$total>=25 & mpg$cty>=20,"우수","일반")


sep_mpg<-mpg[,c(1,6:9,11:13)]
head(sep_mpg,2)
write.csv(sep_mpg,"c:/ken/data/sep_mpg.csv,row.names = F")

View(sep_mpg)

#table() = 집계 or 합계

table(mpg$CON)
install.packages("ggplot2")
library(ggplot2)
dev.new()    #새창으로 열기 (시각화 할떄 같이 드래그해서 출력하면 됨됨)
qplot(mpg$CON)


sep_mpg<-mpg[,c(1,6:9,11:13)]
head(sep_mpg,2)

sep_mpg[2,2]<-"auto(90)" #원하는 행과 열을 변경할 수 있는 법

head(sep_mpg,2)

sep_mpg[1,6]<-"suv"

head(sep_mpg,2)

##############################################################################
#빠진 데이터를 찾는 법 / 결측치 정제하기
#결측치(Missing Value)
#누락된 값, 비어있는 값
#함수 적용 불가, 분석 결과 왜곡
#제거 후 분석 실시

## 결측치 만들기
#결측치 표기 - 대문자 NA

df<-data.frame(sex = c("M","F",NA,"M","F"), score = c(5,4,3,4,NA))
df


#결측치 확인하기

is.na(df)

table(is.na(df))

df[3,1]<-"M" #강제로 내용 수정하는 법

df[3,1]<-NA #원본으로 수정




#결측치 포함된 상태로 분석
mean(df$score, na.rm=T) #평균산출

sum(df$score, na.rm=T) #합계 산출

#결측치 제거하기
#결측치 있는 행 제거하기

library(dplyr)
df %>% filter(is.na(score))

df %>% filter(!is.na(score)) #score 결측치 제거거


#결측치를를 제외한 데이터로 분석하기

df_nomiss<-df %>% filter(!is.na(score))
mean(df_nomiss$score)

sum(df_nomiss$score)

#여러 변수 동시에 결측치 없는 데이터 추출하기
#score, sex 결측치 제외

df_nomiss<-df %>% filter(!is.na(score)& !is.na(sex))
df_nomiss

#결측치가 하나라도 있으면 제거하기

df_nomiss2<-na.omit(df) #모든 변수에 결측치 없는 데이터
df_nomiss2


#summarise()에서 na.rm = T 사용하기









#ctrl+shipt+m = %>% (파이프 연산자 = 여러번 실행해야하는 복잡한 코드를
#                   한번에 실행 시켜주는 연산자/ dplyr 패키지안에 존재하는 것)


#######mini test p113 ########################################################3
install.packages("dplyr")
library(dplyr)

# install.packages('readxl')
library(readxl)
exdata1<-data.frame(read_excel("c:/ken/data/Sample1.xlsx"))

exdata1

exdata1 %>% select(ID)
exdata1 %>% select(ID,AREA,Y17_CNT)

exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA,-Y17_CNT)

exdata1 %>% filter(AREA=='서울')
exdata1 %>% filter(AREA=='서울' & Y17_CNT >= 10)

exdata1 %>% arrange(AGE)

exdata1 %>% arrange(desc(Y17_AMT))

exdata1 %>% arrange(AGE, desc(Y17_CNT))


###############################################################################
#################################[끝나기 전 과제]##############################
###############################################################################

# [Q]
# 파일 디렉터리 설정

setwd()

# 작업 디렉터리 설정을 확인하는 명령어

getwd()

# 변수 목록을 확인하는 명령어

ls()

# 패키지 목록을 확인 하는 명령어

search()

# 패키지 설치하는 명령어

install.packages()

# 패키지를 로드하는 명령어

library()

# r을 실행하는 단축키

#ctrl + enter

# r console 창을 리셋하는 명령어

#ctrl + L

# 집계를 확인 하는 함수는?

table()
table(iris$Species)


#iris 변수를 확인하
li(iris)

names(iris)

#소문자로 만드는 것을 도와줌


tolower()


cas_iris<-tolower(names(iris)) 
cas_iris


#renames()는 변수명을 변경하는 함수 단, dplyr 패키지를 로드 해야함



# r의 설치된 패키지 파일경로를 확인하는 명령어

.libPaths()

# stringr 패키지를 설치시 명령문을 작성하시오.

install.packages("stringr")

# 현재 변수 목록 확인 현재 사용중인 변수중 ex) k1이라는 변수를 삭제하는 방법

rm(k1)

# 현재 환경창에 사용중인 변수 모두를 삭제하는 명령어

rm(list = ls())

# 현재 사용중인 패키지 확인



# r에서 help 패키지 stringr을 찾고 자 할 때 사용하는 명령어는?

search(stringr)

# r의 함수 중 iris라는 데이터 세트가 “몇 행과 몇 열” 정보를 알려주는 함수

str()

# iris의 앞부분의 데이터 6개만 보여주는 명령어

head()

# 기본 통계량을 알려주는 함수

summary()

# 작업형 iris 데이터 셋을 이용하여
# 붓꽃 종이 versicolor 이면서 Sepal.Length 이 6이상인 데이터를 color로 저장
# 저장한 변수 중 Sepal.Length과 Petal.Length 열만 저장하여 csv로 저장

iris<-as.data.frame(iris)
View(iris)


color<-subset(iris,iris$Species=="versicolor" &iris$Sepal.Length >= 6)     
View(color)

color<-iris[iris$Species == "versicolor" & iris$Sepal.Length >= 6,]
View(color)

f<-iris %>% select(Sepal.Length,Petal.Length)

write.csv(f,"c:/ken/과제/ken_lab_03_문세영.csv")

#####이런것을 써도된다

color<-iris %>% select(Sepal.Length,Petal.Length) %>% head(2)


#nrow() 행이 몇개인지 알고 싶을때
#str()
#dim()
#head()위 6개만 보고 싶을떄
#tail()아래 6개만 보고 싶을떄






