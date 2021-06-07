setwd("C:/Users/waudy")

#install.packages("tsDyn")
#install.packages("sm")
install.packages("scatterplot3d")
library(forecast)
library(quantmod)
library(xts)
library(zoo)
library(tseries)
library(tsDyn)
library(sm)
library(scatterplot3d)

data <- read.csv('hinix_long.csv', encoding="UTF-8")
View(data)
str(data)

#--컬럼 전처리, numeric 타입으로 변환--#
# data$당기순이익 <- as.numeric(data$당기순이익)
# data$원달러환율.원. <- as.numeric(data$원달러환율.원.)

sum(is.na(data))
colSums(is.na(data))
#--TS객체로 변환--#

tsdata <- ts(data=data[,], start=c(2000), end=c(2020))
View(tsdata)
str(tsdata)

tsp(tsdata) #데이터 개요
end <- ts(data=data[,2],start=c(2000), end=c(2020))
price <- ts(data=data[,5],start=c(2000), end=c(2020))
high <- ts(data=data[,6],start=c(2000), end=c(2020))
low <- ts(data=data[,7],start=c(2000), end=c(2020))

var1 <- ts(data=data[,13],start=c(2000), end=c(2020))

# 열 번호 및 이름
# (1:날짜), (2:종가), (3:대비), (4:등락률), (5:시가), 
# (6:고가), (7:저가), (8:거래량), (9:거래대금), (10:시가총액), 
# (11:상장주식수), (12:자본금순이익률), (13:자기자본순이익률), (14:주당배당금), (15:배당수익률),
# (16:배당금총액), (17:당기순이익), (18:매출액증가율), (19:영업이익, 조단위), (20:반도체 수출금액지수)
# (21:무담보콜금리), (22:WTI현물유가등락율), (23:환율)

#-- 시계열 자료 부분추출 window --#
train_st <- window(tsdata, start=c(2000),end=c(2014))
test_st <- window(tsdata, start=c(2015),end=c(2020))

#-- 자기상관성 분석--#
tsdisplay(end, main="sk하이닉스 연별 종가 자기상관acf, 부분상관 pacf")

#-- 종가 모형 만들기--#
f1 <- ses(end, h=5) #
accuracy(f1)
f2 <- auto.arima(end)
accuracy(f2)
f3 <- tslm(end~trend)
accuracy(f3)
summary(f3)

#Arima 모델로 유의수준 80%,95%로 10년 예측
forecast(f2,h=10)
plot(forecast(f2, h=10), main="Forecast with 종가, Arima")

#tslm 모델로 유의수준 80%, 95%로 10년 예측
forecast(f3,h=10)
plot(forecast(f3, h=10),main="Forecast with 종가, tslm")
t = seq(2000,2020,length=21)
ll=lm(end~t)
abline(ll, col="red")
grid()

dm.test(residuals(f1),residuals(f2)) # 잔차 비교
dm.test(residuals(f1),residuals(f2), alternative="less")

#-- 상관성 분석 --#
cor.test(end,var1)
cor(data[,2:13])
pairs(data[,2:13])
autotriples(log(end), lag=0:1, type="image")
