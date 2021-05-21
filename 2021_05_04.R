getwd()

setwd("c:/ken/data/")

dataset <- read.csv("c:/ken/data/data3/dataset.csv", header = T)
dataset


print(dataset)
View(dataset)

head(dataset)
tail(dataset)

names(dataset)

attributes(dataset)

str(dataset)

dataset$age

dataset$resident

length(dataset$age)


x<-dataset$gender
y<-dataset$price

x
y

plot(dataset$price)

dataset["gender"]

dataset[2]

dataset[6]

dataset[3,]

dataset[,3]

dataset[c("job","price")]

dataset[c(2,6)]

dataset[c(1,2,3)]

dataset[c(2,4:6,3,1)]

dataset[,c(2:4)]

dataset[c(2:4),]

dataset[-c(1:100),]

summary(dataset$price)
sum(dataset$price)

sum(dataset$price, na.rm = T)
price2<-na.omit(dataset$price)
sum(price2)

length(price2)

dataset$price2 = ifelse(!is.na(x),x,0)
dataset$price2[1:30]

x<-dataset$price
x[1:30]

dataset$price3 = ifelse(!is.na(x),x,round(mean(x,na.rem = TRUE),2))
dataset$price3[1:30]

dataset[c('price','price2','price3')]

table(dataset$gender)

pie(table(dataset$gender))

dataset<-subset(dataset, gender == 1| gender == 2)
dataset

length(dataset$gender)
pie(dataset$gender)

pie(table(dataset$gender),col = c("red","blue"))

#######################

#라면 promote.csv 불러와서 pro_df 로저장

pro_df <- read.csv("c:/ken/data/promote.csv")
pro_df

ls(pro_df)
str(pro_df)

#상관관계
cor(pro_df) #높은 양의 상관관계 = 비례관계 그래프가 생성될 것이라 추측

#lm(data = "데이터셋", 종속변수~ 독립변수)


par(mfrow = c(2,2))

pro_lm<-lm(data = pro_df, price~ promote)
summary(pro_lm)
plot(pro_lm)


#정규성 검사
shapiro.test(resid(pro_lm)) #정규성 0.1461 


#  코스피 <-> 주가
#독립변수 <-> 종속변수(결과)


rnorm(5)

rnorm(5,80,5)


########

data("cars")
head(cars)

lm.dist <- lm(data = cars, dist~ speed)
lm.dist

#3.932 * () -17.579
#기울기* () y절편
#속도를 () 넣으면 거리는 얼마나 
summary(lm.dist)
plot(lm.dist)

#3번째 회귀식의 예측값 분포도 올리지않고 골고루 분포
