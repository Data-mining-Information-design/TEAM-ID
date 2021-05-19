#install.packages('xts')
library(xts)
library(lubridate)

setwd(' your work directory ')
ff <- read.csv(file='./dataset/일별최종.csv', header = TRUE)
d <- ts(ff) #타임 시리즈로 변환
d
sum(is.na(d)) #보간법 적용 전에 결측치 확인

#zoo를 이용한 보간법 적용
zooValues <- zoo(d)
str(zooValues)
approxValues <- na.approx(zooValues)

plot(approxValues)
sum(is.na(approxValues))#결측치 없어졌는지 확인

write.csv(approxValues, file = './dataset/일별최종.csv')

plot(approxValues$유가종가)
