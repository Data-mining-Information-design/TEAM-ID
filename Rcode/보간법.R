install.packages('xts')
library(xts)
library(lubridate)

setwd('C:/Users/jongm/OneDrive - 광운대학교/ProjecTS/TEAM-ID/dataset')
ff <- read.csv(file='./hinix_short3.csv', header = TRUE)
d <- ts(ff) #타임 시리즈로 변환
d
sum(is.na(d)) #보간법 적용 전에 결측치 확인

#zoo를 이용한 보간법 적용
zooValues <- zoo(d)
str(zooValues)
approxValues <- na.approx(zooValues)

plot(approxValues)
sum(is.na(approxValues))#결측치 없어졌는지 확인

write.csv(approxValues, file = './hinix_short4.csv')

plot(approxValues$유가종가) 

#후행보간법
dd <- na.locf(zooValues, fromLast = TRUE) # 2
plot(dd)
write.csv(dd, file = './dataset/hinix_short3.csv')

