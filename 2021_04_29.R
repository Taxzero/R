rm(list = ls())



library(dplyr)


#[Q1]
exam <- data.frame(read.csv("c:/ken/data/csv_exam.csv"))
exam

exam %>% 
  filter(class == 1) %>% 
  select(class,english,science)

exam %>% 
  filter(class == 2) %>% 
  select(class,english,science)



#[Q2]

exam2<-data.frame(read.csv("c:/ken/data/csv_exam.csv"))
exam2

#반전체 수학평균점수
mean(exam2$math, na.rm = T)

#[3]

exam2[c(3,8,15),"math"]<-NA
exam2


#[4]
df_exam2 <- exam2 %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math, na.rm = T), sum_math = sum(math,na.rm = T),
            median_math = median(math,na.rm = T)) %>% 
  mutate(n = 4)

df_exam2


#5 수학 점수 중 na값이 없는 것만 추출 하여 exam3로 저장합니다.
#6 데이터중 na값이 있는 행들은 모두 삭제하여 exam4로 csv파일로 만드세요
#mark down 으로 보내기

exam3 <- exam2 %>% filter(!is.na(exam2$math))
exam3

exam4 <-na.omit(exam3)
exam4

write.csv(exam4,"c:/ken/과제/exam4.csv")


#결측치 대체하기
#결측치가 많을 경우 모두 제외하면 데이터 손실이 크다
#대안: 다른 값 채워넣기

#결측치 대체법(inputation)
#대표값(평균, 최빈값 등)으로 일괄 대체
#통계분석 기법 적용, 예측값 추정해서 대체

class <- c(2,1,2,1,1,2)
english <- c(98,97,40,98,20,89)
science <- c(50,60,78,58,65,98)
df_ex <- data.frame(class,english,science)

df_ex

#3행 5행

df_ex[c(3,5),"english"] <- NA

df_ex[c(3,5),2]<-NA


#영어평균값 구하기
mean(df_ex$english, na.rm = T)

#영어 평균으로 대체하기
df_ex$english <- ifelse(is.na(df_ex$english),95,df_ex$english)
df_ex

### 
class <- c(2,1,NA,1,1,2)
english <- c(98,NA,40,98,20,89)
science <- c(50,60,NA,58,65,98)
df_ex1 <- data.frame(class,english,science)

df_ex1

df_ex2 <-na.omit(df_ex1) #NA를 모두 지우는 법(NA가 있던 행이 모두 지워짐)
df_ex2

#######
library(readxl)
exdata1<-read_excel("c:/ken/data/Sample1.xlsx")
exdata1

stem(exdata1$AGE)

#mini Q
stem(exam4$math)
#######


hist(exdata1$AGE)

hist(round(rnorm(50,75,3),0))
hist(round(rnorm(50,75,20),0))

#그래프 비교 두개 띄우기

par(mfrow = c(2,1))

#제목 변경하기 main = "" 해준다.
hist(round(rnorm(50,75,3),0),main = "AGE분포")
hist(round(rnorm(50,75,20),0),main = "AGE분포")




#빈도분석 막대 데이터
install.packages("descr")
library(descr)

par(mfrow = c(1,1))

freq(exdata1$SEX, plot = T,main = '성별(barplot)')

#막대그래프
dist_sex <- table(exdata1$SEX)
dist_sex
barplot(dist_sex)

#y축 0~8로 변경
barplot(dist_sex, ylim = c(0,8))

#y축을 0~8로 변경 및 그래프 명칭을 'BARPLOT', X축 제목을 'SEX'
#Y축 제목을 'FREQUENCY', 항목값을 'Female','male'
barplot(dist_sex,ylim = c(0,8), main = "BARPLOT", xlab = "SEX", ylab = "FREQUENCY",
        names = c("Female","Male"))

#y축을 0~8, 그래프 명칭을 'BAEPLOT', X축제목을 'SEX'
#Y축 제목을 'FREQUENCY', 항목값을 'Female','male'로 변경 및 그래프 색 변경
barplot(dist_sex,ylim = c(0,8), main = "BARPLOT", xlab = "SEX", ylab = "FREQUENCY",
        names = c("Female","Male"), col = c("pink","navy"))

library(readxl)
exdata1 <- read_excel("c:/ken/data/Sample1.xlsx")
exdata1

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0,60), main = "boxplot",
        names = c("17년건수","16년건수"))
  
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0,60), main = "boxplot",
        names = c("17년건수","16년건수"), col = c("green","yellow"))


#아웃라이어=이상치
rm(list = ls())

y1 <- c(1,2,3,4,5,6,7,8,9,10,20,25)
boxplot(y1)

y1

y1 <- ifelse(y1 > 10, NA, y1)

y1

boxplot(y1)

###웹크롤링

#정적 스크래핑(크롤링)

#데이터수집
#정적스크레핑(크롤링), 네이버 영화 사이트 댓글정보 스크래핑 네이버 영화 사이트의 데이터중 영화제목,
#평점, 리뷰만을 추출하여 CSV 파일의 정형화된 형식으로 저장한다.
#(1) 스크래핑 하려는 웹체이지의 URL구조와 문서 구조를 파악해야한다.

install.packages("rvest")
library(rvest)
library(stringr)
library(wordcloud)
library(wordcloud2)
library(dplyr)
library(KoNLP)
library(RColorBrewer)
useNIADic()
useSejongDic()


rm(list = ls())

main_url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=27260&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N&order=sympathyScore&page="

main_url

reply_list <- character()
star_list <- numeric()
date_list <- character()

page_url = 1

for (page_url in 1:10) {
  
  url <- paste(main_url, page_url, sep = "")
  
  content <-read_html(url)
  
  node1 <- html_nodes(content,".score_reple p")
  node2 <- html_nodes(content,".score_result .star_score em")
  node3 <- html_nodes(content,".score_reple em:nth-child(2)")
  
  reply <- html_text(node1)
  star <- html_text(node2)
  date <- html_text(node3)
  date <- as.Date(gsub("\\.","-",date))
  
  reply_list <- append(reply_list, reply)
  star_list <- append(star_list, star)
  date_list <- append(date_list, date)
}

df <- data.frame(reply_list, star_list, date_list)
colnames(df) = c("댓글", "평점","날짜")
df

View(df)

write.csv(df,"c:/ken/수업/naver_movie.csv")


a <- read.csv("c:/ken/수업/naver_movie.csv")

naver<-a[,2]

naver <-unique(naver)
naver

naver <- str_replace_all(naver,"[^[:alpha:][:blank:]]","")
naver

naver2 <- extractNoun(naver)
naver2

naver2 <-lapply(naver2, unique)
naver2

naver3 <- unlist(naver2)
head(naver3,5)

naver4 <-Filter(function(x) {nchar(x) <= 20 & nchar(x) > 2}, naver3)
naver4

naver4 <-gsub("\\.","",naver4)
naver4 <-gsub("\\'","",naver4)
naver4 <-gsub("\\^","",naver4)
naver4 <-gsub("[^가-핳]|ㅋ","",naver4)
naver4

wordcount <- table(naver4)
sort(wordcount, decreasing = T)

txt <- readLines("c:/ken/수업/naver_gsub.txt")
txt

cnt_txt <-length(txt)
cnt_txt

for (i in 1:cnt_txt) {
  naver4 <-gsub((txt[i]),"",naver4)
}

naver4 <- Filter(function(x) {nchar(x) <= 10 & nchar(x) > 1} ,naver4)
naver4

wordcount <- table(naver4)
wordcount

wordcount<-head(sort(wordcount, decreasing = T),100)
wordcount

palete <- brewer.pal(7,"Set3")
wordcloud(names(wordcount), freq = wordcount, scale = c(2,1), rot.per = 0.5,
          min.freq = 1, random.order = F, random.color = T, colors = palete)


wordcloud2(wordcount, fontFamily = "맑은고딕", size = 0.5, color = "random-light",
           backgroundColor = "black")
