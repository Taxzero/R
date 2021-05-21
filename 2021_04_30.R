
#html_node() #attrbute의 name을 가져옴 - 매칭되는 한 요소를 반환(해당이름만 가져옴)

#html_nodes() #attrbute 의 value 추출 - 매칭되는 모든 요소 반환
#(tag나 css 모두 가져올 경울)

#######
html_txt() #텍스트를 추출

html_name() #attrbute의 name을 가져옴

html_attrs() #tag의 이름 추출

html_children() #해당 요소의 하위 요소를 읽어온다.

#  <drv align = "left"> 안녕하세요 반갑습니다. </drv>

################################

rm(list = ls())

library(KoNLP)
library(dplyr)
library(stringr)
library(brew)
library(wordcloud)


################################ 패키지

txt <- readLines("c:/ken/data/hiphop.txt")
head(txt)

#단어가 아닌 것을 찾아 지우기
txt <- str_replace_all(txt,"\\W","")


#특수문자 제거
txt <- str_replace_all(txt,"[가-힣] ]","")

txt

nouns <- extractNoun(txt)

#추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

#데이터 프레임으로 변환
df_word <-as.data.frame(wordcount, stringsAsFactors = F)

#변수명 수정

df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

head(df_word)

#두글자이상단어추출
df_word <- filter(df_word, nchar(word) >= 2)

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)


#워드 클라우드 만들기
#단어 색상 목록 만들기
pal <-brewer.pal(9,"Blues")[1:9] #Dark2 색상 목록에서 8개의 색

set.seed(1)                               #난수고정

wordcloud(words = df_word$word,           #단어
          freq = df_word$freq,            #빈도
          min.freq = 2,                   #최소 단어 빈도
          max.words = 100,                #표현 단어 수
          random.order = F,               #고빈도 단어 중앙 배치
          rot.per = 0.5,                  #회전 단어 비율
          scale = c(3,0.3),               #단어 크기 범위
          colors = pal)                   #색깔 목록


##################

dev.new() #새창 띄우기
display.brewer.all() #색상표 참고


##################

data(mtcars)

filter(mtcars, cyl == 4)
head(arrange(mtcars, wt))

head(select(mtcars, am, gear))

head(mutate(mtcars, years = '1974'))

distinct(mtcars, cyl)

summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))


####p248~p249

install.packages("reshape2")

library(readxl)
library(reshape2)

middle_mid_exam <- read_excel("c:/ken/data/middle_mid_exam.xlsx")
middle_mid_exam

#보류
melt()
dcast(MATHEMATICS, ENGLISH)

 
summarise(middle_mid_exam,en_mean = mean(ENGLISH),en_sum = sum(ENGLISH),
            ma_mean = mean(MATHEMATICS), ma_sum = sum(MATHEMATICS))


class1_math <- middle_mid_exam %>% 
  group_by(CLASS,MATHEMATICS) %>% 
  filter(CLASS == "class1" & MATHEMATICS >=80) %>% 
  summarise(n())
  
class1_math

sort(middle_mid_exam)

#################3

library(readxl)

ck <- read_excel("c:/ken/data/치킨집_가공.xlsx")
head(ck)

addr <- substr(ck$소재지전체주소,11,16)
head(addr)

addr_num <-gsub("[0-9]", "", addr)
addr_trim <- gsub(" ","",addr_num)
head(addr_trim)

library(dplyr)

addr_count <- addr_trim %>%  table() %>% data.frame()
head(addr_count,17)

install.packages("treemap")
library(treemap)

treemap(addr_count, index = ".", vSize = "Freq", title = "서대문구 동별 치킨집 분표표")

###########################

rm(list=ls())


hos <- read_excel("c:/ken/data/서울강남병원.xlsx")
head(hos)

View(hos)


address <- substr(hos$도로명전체주소,11,16)
head(address)

address_num <-gsub("[0-9]","",address)
address_trim <-gsub(" ","",address_num)
address_trim <-gsub("길","",address_num)
head(address_num)

address_count <- address_trim %>% table() %>% data.frame()
head(address_count)

treemap(address_count, index = ".", vSize = "Freq", title = "서울특별시 강남구 병원 분표도")
 

#font 폰트

install.packages("extrafont")
library(extrafont)

theme_gray(base_family = 'AppleMyungjo')



####################

rm(list = ls())

data("GNI2014")

View(GNI2014)

??GNI2014

ls(GNI2014)

head(GNI2014)

treemap(GNI2014,
        index = c("continent","iso3"),
        vSize = "population",
        title = "세계인구",
        bg.labels)


#교육생 실습1
#인구수가 높은순 20개 나라 순으로 정렬하여 GNI2014_po 데이터셋으로 저장
#저장한 데이터 셋을 이용하여 인구순 20개를 treemap으로 작성하시오


GNI2014_po <-GNI2014 %>% 
  arrange(desc(population)) %>% 
            head(20)


treemap(GNI2014_po,
        index = c("continent","iso3"),
        vSize = "population",
        title = "TOP20 인구수",
        bg.labels)

#교육생 실습
#mutate 함수를 사용하여 파생변수 (per_pop)을 생성한 후
#1인당 국민소득 작성하시오 (GNI2014_per 데이터셋)

GNI2014_per <-GNI2014 %>% 
  mutate(per_pop = GNI/population) %>% 
  arrange(desc(per_pop)) %>% 
  head(20)

treemap(GNI2014_per,
        index = c("country","continent"),
        vSize = "per_pop",
        title = "TOP20 1인 국민소득", border.col = "white")



###########









