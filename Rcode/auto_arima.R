#install.packages('forecast')
#install.packages('TTR')
#install.packages('fpp')
library(forecast)
library(TTR)
library(fpp)
library(dplyr)

setwd(' user work directory ')
hinix_diff <- read.csv(file='hinix.csv', header = TRUE)
hinix <- read.csv(file='hinix.csv', header = TRUE)
hinix_diff[2]

hinix_diff_ts <- ts(hinix_diff[,2])
hinix_diff_ts
sum(is.na(hinix_diff_ts))
hinix_diff_ts <-  na.omit(hinix_diff_ts)
plot.ts(hinix_diff_ts)
adenoTS = ts(hinix_diff_ts)
arima_fit2 = auto.arima(adenoTS)
arima_fit2

accuracy(arima_fit2)

kings_arima <- arima(hinix_diff_ts, order = c(0,1,2))    # 차분통해 확인한 값 적용
kings_arima


kings_fcast <- forecast(kings_arima, h=1000)
kings_fcast
accuracy(kings_fcast)

checkresiduals(kings_fcast)
autoplot(kings_fcast)

xx <- ts(hinix_diff_ts, frequency = 365) #1년주기
stl(xx, "periodic")
decompose(xx)
plot(decompose(xx))
