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

wordcloud2(word_table2, color = "random-light", backgroundColor = "black")

wordcloud2(word_table2, fontFamily = "맑은고딕", size = 1.2, color = "random-light", backgroundColor = "black", shape ="star")

##ORA-12345:__ 에서 숫자까지만 잘라내서 워드클라우드 그리기
alert11 <- readLines("c:/ken/data/oracle_alert_testdb.log")

alert12 <- grep("^ORA-+",alert11, value =  T) #ORA-12345:__ 형식으로 한줄만 가져오기
alert12

alert13 <- substr(alert12,1,9)

errorcount1 <- table(alert13)
errorcount1

sort(errorcount1, decreasing = T)

install.packages("wordcloud")
library(wordcloud)

install.packages("RColorBrewer")
library(RColorBrewer)

palete <- brewer.pal(7, "Set1")
wordcloud(names(errorcount1),freq = errorcount1, scale = c(5,0,5),
          rot.per = 1.5, min.freq = 3, random.order = F,
          random.color = T, colors = palete)

library(stringr)

#step1 분석할 데이터를 불러옵니다.
data1<- readLines("c:/ken/data/좋아하는과일2.txt")
data1

#step2 중복되는 리뷰를 제거해야 할 경우 아래 명령을 수행
data1 <- unique(data1)
data1

#step3 특수 기호를 모두 제거합니다.
data1 <- str_replace_all(data1,"[^[:alpha:][:blank:]]","")
data1

#step4 아래 과정의 불러온 리뷰 문장을 단어로 불리하세요
data2 <- extractNoun(data1)
data2

#step5 한줄 안에서 중복되는 단어를 제거해야 할 것
data2 <- lapply(data2, unique)
data2

#step6 띄어쓰기가 안되어 있는 긴 문장(단어)을 제거해야 할 경우 아래 명령어 사용
#이 작업을 하는 명령어는 Filter()함수인데 벡터로 데이터를 넣어야 합니다.
#그래서 unlist()함수로 list() 형태의 데이터를 백터 형태로 변형해야합니다.

data3 <- unlist(data2)
head(data3,5)

data4 <-Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, data3)
data4

#step7 아래 과정이 필요없는 단어들이나 기호를 제거하는 과정
data4 <-gsub("\\.","",data4) #마침표제거
data4 <-gsub("\\'","",data4) #홀따옴표제거
data4 <-gsub("\\^","",data4) #캐럿기호제거

data4

#step8 추출된 키워드를 임시로 확인하기 위해 집계
wordcount <- table(data4)
sort(wordcount, decreasing = T)

#저장형식은 ANSI 으로 저장
txt <- readLines("c:/ken/data/1_gsub.txt")
txt

#불용어 단어 개수
cnt_txt <- length(txt)
cnt_txt

#불용어 첫 행부터 마지막행까지 cnt_txt 까지 gsub 반복실행
for (i in 1:cnt_txt) {
  data4 <-gsub((txt[i]),"",data4)
}
data4

#위 작업을 하고 나서 삭제된 공백이나 1글자 이하의 글자를 제거
data4 <- Filter(function(x) {nchar(x) <= 10 & nchar(x) > 1} ,data4)
data4

#step9 최종 결과를 집계하며 워드 클라우드로 시각화 합니다.
wordcount <- table(data4)
wordcount

sort(wordcount, decreasing = T)

palete <- brewer.pal(9,"Set3")
wordcloud(names(wordcount), freq = wordcount, scale = c(4,1), rot.per = 0.5,
          min.freq = 1, random.order = F, random.color = T, colors = palete)











