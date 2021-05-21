








#######

#출력함수 print/cat
#print(x,...)= 구조 print(출력데이터[,옵션들])

print(100)
print(pi)
data<-c("사과","딸기","포도")
print(data)
print(data,quote=FALSE) #"" 쌍따옴표를 지운다.
print(data, print.gap = 3, quote = FALSE) #갭은 공간을 늘린다.(데이터사이)
1+1

#prints는 자동으로 따로 실행됨

print("/n") #\n = 엔터


x<-20
if(x>10){

print("x is lage number")
}

print("a"=="A")


#cat()=줄바꿈기능이 없다., 구조 cat(...,옵션들)

cat(100,200)
1+1

#cat은 자동으로 붙어서 실행 cat으로 따로 실행하고싶을떄는 /n을 넣어 준다.

cat(100,200,"/n")
1+1


x<-20
if(x>10) {
  
  cat(x,"x is lage number")
}

##########################################3

for(i in 1:10)
cat(i, "반복 실행 중입니다.","\n")         #\t = tab , n\ = enter

paste0(i, "번째 실행중입니다.")     #공백을 제거


for(i in 1:10)
cat(paste0(i, "반복 실행 중입니다.","\n"))






vec1<-c(1:100)
for (i in vector) {
  cat(paste("x",i, "=", gg = i))
}

for (i in 1:10) {
  print(paste(gg,"x",i,"=",gg=i))
}



sum <- 0

for (i in 1:20) {
  sum <- sum+i
}
sum


a<- 7

# %% 는 나머지로 짝수와 홀수를 구할때 사용
#if eles를 사용해서 구할때는 엔터도 치지말고 중괄호 밑에 바로 붙게 사용

if (a %% 2 == 0) {
  print(a)
  print("짝수")
} else{
  print(a)
  print("홀수")
}



data<-c(1:10)

switch(data[3],
      "1" = print("One"),
      "2" = print("Twe"),
      "3" = print("Three"),
      print("Null")
      )

#substr = 변수, 시작번째, 마지막번째

user <- function(){
  answer <- readline("input Data :")
  
  if(substr(answer, 1, 1)=="N") cat("아니오")
  else
    cat("예")
  }

users(N)




library()#설치된 패키지 확인
search()# 현재 로드된 패키지 확인

#제어구문(반복문)
#데이터를 분석하는 과정에서 동일한 일을 반복적으로 실행시 짧은 코딩으로 동일한 일을 처리

for( i in data) #data에 들어있는 가각의 값을 변수 i에 할당 하면서 각각에 있는 블록 안의 문장수행
  #i를 사용한 문장
  
while(con) #조건 con이 참일때 블록안의 문장을 수행
  #조건이 참일때 수행할 문장
      
repear #블럭안의 문장을 반복해서 수행
  #반복해서 수행할 문장
      
 #break = 종료 , next - 다음 실행

install.packages("dplyr")
library(dplyr)

ls(iris)

distinct(iris,iris$Species)

###########################################

#불용어를 제거합니다.
txt<-readLines("ka_gub.txt")
txt
cnt_txt<-length((txt))
cnt_txt


################################################

#조건에 맞는 데이터만 추출하기

install.packages("dplyr")
library(dplyr)

exam<-read.csv("c:/ken/data/csv_exam.csv")

#1반인 경우
exam %>% filter(class==1)
#2반인 경우
exam %>% filter(class==2)
#1반이 아닌 경우
exam %>% filter(class !=1)
#수학점수가 50초과인 경우
exam %>% filter(math>50)
#수학점수가 50초과 이면 영어점수가 90이상인 경우
exam %>% filter(math>50 & english>=90)

#여러 조건을 충족하는 행 추출하기#
#1반이면서 수학점수가 50점이상인 경우
exam %>% filter(class==1, math>=50)

#id와 영어점수, 과학점수 열만 가지고 아래 데이터를 출력하시오
exam %>% 
  select(id,english,science) %>%
  filter(english<90 | science < 50) %>% 
  head(2)

#데이터 %>% 원하는 목록 선택 %>% 원하는 조건 %>% 원하는 만큼만 보기


#%in% 기호 이용하기

exam %>% filter(class %in% c(1,3,5)) # 1,3,5반에 해당하면 추출


#1반 수학 점수 평균 구하기

class1<-exam %>% filter(class==1)

mean(class1$math)


#2반영어점수 합계구하기

class2<-exam %>% filter(class==2)

sum(class2$english)

##############################################################


#총합변수추가/일부추출

exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam #아직 변수목록에 total이 들어가있지 않음
ls(exam)



#변수목록에 total을 넣으려면 따로 넣어준다.
exam_1<-exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam_1

ls(exam_1)

#여러파생변수 한 번에 추가하기

exam %>% 
  mutate(total = math + english + science,
         mean=(math + english + science)/3)

exam

exam_tot<-exam %>% 
  mutate(total = math + english + science,
         mean=(math + english + science)/3)

exam_tot

#Q1
#result파생변수를 생성
#생성된 파생변수에 과학점수가 70점 이상이면 pass 아니면 fail을 출력

exam_3<-exam %>% mutate(result=ifelse(science>=70,"pass", "fail"))
exam_3
#Q2
exam %>% 
  mutate(total = math + english + science) %>% arrange(total) %>% 
  head

#집단별로 요약하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

library(readxl)

exdata1<-data.frame(read_excel("c:/ken/data/Sample1.xlsx"))
exdata1

exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT=sum(AMT17))

library(readxl)
m_history<-read_excel("c:/ken/data/Sample2_m_history.xlsx")
f_history<-read_excel("c:/ken/data/Sample3_f_history.xlsx")
View(m_history)
View(f_history)
exdata_bindjoin<-bind_rows(m_history,f_history)
View(exdata_bindjoin)

#########################[Q]##################################

#문제) 제조사별로 "suv" 자동차의 도시 및 고속도로 통합연비 평균을 구해
#내림차순으로 정렬하고 1~5위까지 출력하기

library(ggplot2)
mpg<-data.frame(ggplot2::mpg)
mpg

suv_total<-mpg %>% 
  group_by(manufacturer) %>% 
  filter(class %in% "suv") %>% 
  mutate(total = (cty+hwy)/2) %>% 
  summarise(m_total = mean(total)) %>% 
  arrange(desc(m_total)) %>% 
  head(5)

suv_total

View(suv_total)

#데이터 병합
#중간고사 데이터 생성



test1<-data.frame(id = c(1,2,3,4,5),
                  midtern = c(60, 80, 70, 90, 85))

test2<-data.frame(id = c(1,2,3,4,5),
                  midtern = c(70, 83, 65, 95, 80))


#id 기준으로 합치기

total<-left_join(test1,test2, by = "id")
total


#다른 데이터 활용해 변수 추가하기
#반별 담임 교사 명단 생성

exam<-read_excel("c:/ken/data/excel_exam.xlsx")

exam

name<-data.frame(class = c(1,2,3,4,5),
                 teacher = c("kim","lee","park","choi","jung"))
name


exam<-read.csv("c:/ken/data/csv_exam.csv")

exam

exam_new<-left_join(exam, name, by = "class")

#아래로 합치기
#데이터 생성
#학생 1~5번 시험 데이터 생성



group_a<-data.frame(id = c(1,2,3,4,5),
                    test = c(60,80,70,90,85))


group_a<-data.frame(id = c(6,7,8,9,10),
                    test = c(65,85,75,95,90))

#세로로 합치기
group_all<-bind_rows(group_a, group_b)

group_all




