library(ggplot2)
library(dplyr)


#상자그림 만들기
ggplot(data = mpg, aes(x=drv, y=hwy))+geom_boxplot()

par(mfrow = c(2,1))
y1<-c(1,2,3,4,5,6,7,8,9,10,20,25,100)
summary(y1)
boxplot(y1, las=1) # y1 변수의 상자 그림 그리기기


y2<-c(50,20,3,45,5,20,15,30,9,10,20,25)
summary(y2)
boxplot(y2)

###########혼자서 해보기
#mpg 데이터를 이용해서 분석문제를 해결해 보세요
#[Q]class(자동차 종류)가 'comport','suv'인 자동차의 cty(도시연비)가 어떻게 다른지
#비교해보려고 합니다. 새 차종의 cty를 나타낸 상자 그림을 만들어 보세요.

mpg

new_cty<-mpg %>% 
  filter(class %in% c("compact","subcompact","suv"))


ggplot(data = new_cty, aes(x = class, y = cty))+geom_boxplot()

#boxplot 교육생 실습
#데이터가 전체 데이터의 범위에서 벗어나는지 를 확인
#ls(mpg) #데이터셋의 변수확인
#distinct(mpg,manufactuer) #중복없이 값확인
#제조사별 고속도로 연비(hwy)를 박스플롯으로 보기
#boxplot(hwy~manufactuer, data = mpg)



abc<-c(100,300,150,280,310)

def<-c(180,200,210,190,170)

ghi<-c(210,150,260,210,70)


df_box<- data.frame(A = abc, B = def, C = ghi)


boxplot(df_box, col = cm.colors(3))

summary(df_box)


#boxplot을 이용하여 데이터 프레임인 df_box의 그래프를 만든 후
#summary를 사용하여 데이터 요약값을 콘솔창에 출력합니다.
#    A             B             C      
# Min.   :100   Min.   :170   Min.   : 70  
# 1st Qu.:150   1st Qu.:180   1st Qu.:150  
# Median :280   Median :190   Median :210  
# Mean   :228   Mean   :190   Mean   :180  
# 3rd Qu.:300   3rd Qu.:200   3rd Qu.:210  
# Max.   :310   Max.   :210   Max.   :260
#
#제 1사분위수에 해당하는mean과 중앙값(median),제3사 분위수등 A값의 크기가 가장 큽니다.
#다음으로는 C, B 순서로 중앙값의 크기가 큽니다. 하지만  제1분위수는 B가 더 크다는 것을 알 수 있습니다.


grep_ex <- c("a.txt","A.txt","ab.txt","123.txt","beta123.txt")

grep("^a", grep_ex) #위치번쨰

grep("^a",grep_ex, value = TRUE)

grep("[0-9]", greb_ex, value = TRUE) #숫자포함

##숫자로 시작하는 데이터 제외
grep("^[^0-9]", greb_ex, value = TRUE)

##
ptn<-c["^a","^A"]
grep(paste(ptn, collapse = "|"), greb_ex, value = TRUE)

#nchar 예제 1 p89
nchar_ex1<- "먹어도 먹어도 배고파요 ㅠㅠ...정상입니다."
nchar(nchar_ex1)

nchar_ex2<- c("a.txt","A.txt","ab.txt","123.txt","ba123.txt")
nchar(nchar_ex2)

#paste 예제 p90
paste(1,2,3)

#######past와 paste0은 사이띄기 차이이며
#paste 옵션인 sep=""

paste(1,2,3,sep = "") #아래와 같은 결과
paste0(1,2,3)
paste("a","b","c")
paste("a","b","c",sep="")
paste("a","b","c",sep="-")

#substr 예제 p90
substr("820715",3,4)

#strsplit 예제 p91
tel<-"031)123-4567"
strsplit(tel, ")")
tel<-"031-123-4567"
strsplit(tel, "-")



##### stringr 패키지와 주요 함수들 --교재 p91
install.packages("stringr")
library(stringr)

str_extract("홍길도35이순신45유관순25","[1-9]{2}")

str_extract_all("홍길도35이순신45유관순25","[1-9]{2}")

string<-"hongd105leess1002you25강감찬찬2005"

str_extract_all(string,"[a-z]{3}")

str_extract_all(string,"[a-z]{3,}")

str_extract_all(string,"[a-z]{3,5}")

str_extract_all(string,"[0-9]{2,4}")

#
c<-str_extract_all("홍길도35이순신45유관순25","[1-9]{2}")
c
c<-unlist(c) #리스트 해제
c
c<-paste(c, collapse = "");c
substr(c,3,4)




##### stringr() 패키지 예제2 p92

txt4<-c("aa.txt","bb.txt","ab.txt","123.txt")
str_replace_all(txt4,'a','z')

tx5<-"사랑 사랑 누가 말했나~~"
str_replace(txt5,'사랑','간식')
str_replace_all(txt5,'사랑','간식식')

string<-"hongkd105leess1002you25강감찬2005"
len<-str_length(string)
len

string<-"hongkd105leess1002you25강감찬2005"
str_locate(string,"강감찬")
string_sub<-str_sub(string,1,len-7)
string_sub
string_sub<-str_sub(string,1,23)
string_sub


Data2<-c("2017-02-05 수입 3000원",
         "2017-02-06 수입 4500원",
         "2017-02-07 수입 2500원")

#
str_extract(Data2, '[0-9]{4,5}[가-힣]')
#
str_replace_all(Data2,'[0-9],{1}','')
#
str_replace_all(Data2,'-','/')

name<-scan(what = character())

name


#p99
titanic<-
  read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")

titanic

dim(titanic)

str(titanic)

table(titanic$age)

table(titanic$sex)

table(titanic$survived)

str(titanic)

head(titanic)

tail(titanic)


tab<-table(titanic$survived, titanic$sex) #성별에 따른 생존 여부
tab

barplot(tab,col = rainbow(2), main = "성별에 따른 생존 여부")


######연습문제 p106

write.csv(titanic, "c:/ken/data/titanic.csv")

titanicData<-read.csv("c:/ken/data/titanic.csv")
str(titanicData)

head(titanicData)

data(CO2)
CO2

CO2_df1<-CO2 %>% filter(Treatment == "nonchilled")
CO2_df1  

write.table(CO2_df1, "CO2_df1.csv", row.names = FALSE)

CO2_df2<-CO2 %>% filter(Treatment == "chilled")
CO2_df2  

write.table(CO2_df2, "CO2_df2.csv", row.names = FALSE)


library(dplyr)




#####

#libpath() 패키지 경로

Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jre1.8.0_291") #자바 설정
Sys.getenv("JAVA_HOME") #자바설정 확인

install.packages("rJava")
install.packages("KoNLP")
install.packages("remotes")

library(rJava)
library(KoNLP)
library(remotes)

remotes::install_github('haven-jeon/KoNLP',upgrade = "never",
                        INSTALL_opts = c("--no-multiarch"))



library(KoNLP)

library(wordcloud2)

useSystemDic()
useSejongDic()
useNIADic()

#텍스트파일 데이터를 word_data에 할당

word_data <- readLines("c:/ken/data/애국가(가사).txt")
word_data

word_data2<-sapply(word_data, extractNoun, USE.NAMES = F)
word_data2


add_words<-c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic = data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic = T)

word_data2<-sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

undata<-unlist(word_data2)
undata

word_table <- table(undata) #table은 집계
word_table

undata2 <- Filter(function(x) {nchar(x) >=2},undata)
word_table2 <- table(undata2)
word_table2

sort(word_table2,decreasing = T)


wordcloud2(word_table2)

