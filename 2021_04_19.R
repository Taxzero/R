getwd() #check working directory

sqrt(16)

x<-10
x
y<-3
y
x+y
x-y

x1<-c(10,9,7) #vector
x1

y1<-"사과라떼"
y2<-c("사과라떼","딸기라떼","호박라떼")

x1<-c(10,9,"7")

y3<-1:10 #continuous data
y3

y3 ; x1 #한줄에 입력력

x1<-(1:3)
x2<-(1:2)
xx<-x1+x2
xx

var3<-seq(1,5)
var3

var4<-seq(1,10,by=2)
var4

var5<-seq(1,10,by=3)
var5

v1<-rep("A",times=5)
v1

v2<-rep(c("A","b"),each=2) ;v2

print("hello world")

sample(1:10,5)#1에서 10까지 5개 출력
sample(1:7,5,replace=FALSE,prob=1:7) #replace는 중복허용 #prob는 비율이 뒤로 갈수록 많이 나옴
sample(1:10,3,replace=TRUE,prob=1:10)

x<-c(1,2,3) #기술통계
mean(x)
max(x)
min(x)

x
rm(x) #rm 삭제 
x
rm(list = ls()) #전체 변수 삭제

x<-c(20:30)
x[1]
x[-1] #1빼고 다 나온다

#Q 3번째에서 5번째 제외하라
x[-c(3:5)]
x[-3:-5]

rm(list=ls())
