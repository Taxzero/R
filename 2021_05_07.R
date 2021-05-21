#히스토그램의 시작점과 끝점에 따라 그래프 모양이 달라지는 단점을 보완하기 위한
#대안으로<<밀도 함수>>를 이용해보자
#밀도도표는 density

density()
plot()
str(iris)

################################
ds_iris <- density(iris$Sepal.Width)
plot(ds_iris) #기본 형태의 밀도 곡선 완성

###내부 색상을 위해서는 먼저 기존데이터 갖고오기
iris
ds_iris <- density(iris$Sepal.Width)
plot(ds_iris, main = "확률밀도") #기본 형태의 밀도 곡선 완성
polygon(ds_iris, col = "red", border = "blue") #내부와 외부경계선 만들기
rug(iris$Sepal.Width, col = "brown",)


##############################
x<-iris$Sepal.Length
par(mfrow = c(1,1))
qqnorm(x)
qqline(x,col="red",lwd=2)

##############################