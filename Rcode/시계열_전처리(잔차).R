#install.packages("ggplot2")
#install.packages('tseries')
library(ggplot2)
library(tseries)

setwd('C:/Users/jongm/OneDrive - 광운대학교/ProjecTS/TEAM-ID')
getwd()
hinix <- read.csv(file='./dataset/hinix_short.csv', header = TRUE)

str(hinix)

par(oma=c(0,0,0,0))
par(mfrow=c(1,1))

plot(hinix$종가, type = 'l')
plot(hinix$시가, type = 'l')
plot(hinix$대비, type = 'l')
plot(hinix$등락률, type = 'l')
plot(hinix$저가, type = 'l')
plot(hinix$거래량, type = 'l') #로그
plot(hinix$거래대금, type = 'l')
plot(hinix$시가총액, type = 'l')
plot(hinix$상장주식수, type = 'l')

sum(is.na(hinix))

for (i in 2:11){
  tshi <- ts(hinix[i])
  loc <- paste("./시각화/각변수",i,"번째.png")
  png(filename = loc)
  par(oma=c(0,0,5,0))
  par(mfrow = c(1,2))
  acf(tshi)
  pacf(tshi, main='PACF')
  dev.off()
}

'귀무가설(H0): 자료에 단위근이 존재한다.
대립가설(H1): 시계열 자료가 정상성을 만족한다(또는 추세 정상성을 만족한다).
하지만 대립가설은 어떤 방정식을 사용하느냐에 따라 조금씩 다르다.'''
adf.test(hinix$종가 , k=0)
adf.test(hinix$대비 , k=0)
adf.test(hinix$등락률 , k=0)
adf.test(hinix$시가 , k=0)
adf.test(hinix$고가 , k=0)
adf.test(hinix$저가 , k=0)
adf.test(hinix$거래량 , k=0)
adf.test(hinix$거래대금 , k=0)
adf.test(hinix$시가총액 , k=0)
adf.test(hinix$상장주식수 , k=0)

#데이터 변환하기
#차분
hicf <- diff(ts(hinix$종가))
plot(hicf, type = 'l')
adf.test(hicf, k=0)
#로그변환
hilo <- log(hinix$종가)
plot(hilo, type='l')
is.na(hilo)
adf.test(hilo, k=0)

hilo <- diff(hilo)
plot(hilo, type='l')

#제곱근 변환
hisq <- sqrt(hinix$종가)
plot(hisq, type='l')
adf.test(hisq, k=0)

hisq <- diff(hisq)
plot(hisq, type='l')
adf.test(hisq, k=0)
hi종가 <- hicf

#차분
hicf <- diff(ts(hinix$시가))
plot(hicf, type = 'l')
adf.test(hicf, k=0)
#로그변환
hilo <- log(hinix$시가)
plot(hilo, type='l')
is.na(hilo)
adf.test(hilo, k=0)

hilo <- diff(hilo)
plot(hilo, type='l')

#제곱근 변환
hisq <- sqrt(hinix$시가)
plot(hisq, type='l')
adf.test(hisq, k=0)

hisq <- diff(hisq)
plot(hisq, type='l')
adf.test(hisq, k=0)
hi시가 <- hicf

#차분
hicf <- diff(ts(hinix$고가))
plot(hicf, type = 'l')
adf.test(hicf, k=0)
#로그변환
hilo <- log(hinix$고가)
plot(hilo, type='l')
is.na(hilo)
adf.test(hilo, k=0)

hilo <- diff(hilo)
plot(hilo, type='l')

#제곱근 변환
hisq <- sqrt(hinix$고가)
plot(hisq, type='l')
adf.test(hisq, k=0)

hisq <- diff(hisq)
plot(hisq, type='l')
adf.test(hisq, k=0)
hi고가 <- hicf

#차분
hicf <- diff(ts(hinix$저가))
plot(hicf, type = 'l')
adf.test(hicf, k=0)
#로그변환
hilo <- log(hinix$저가)
plot(hilo, type='l')
is.na(hilo)
adf.test(hilo, k=0)

hilo <- diff(hilo)
plot(hilo, type='l')

#제곱근 변환
hisq <- sqrt(hinix$저가)
plot(hisq, type='l')
adf.test(hisq, k=0)

hisq <- diff(hisq)
plot(hisq, type='l')
adf.test(hisq, k=0)
hi저가 <- hicf


#차분
hicf <- diff(ts(hinix$시가총액))
plot(hicf, type = 'l')
adf.test(hicf, k=0)
#로그변환
hilo <- log(hinix$시가총액)
plot(hilo, type='l')
is.na(hilo)
adf.test(hilo, k=0)

hilo <- diff(hilo)
plot(hilo, type='l')

#제곱근 변환
hisq <- sqrt(hinix$시가총액)
plot(hisq, type='l')
adf.test(hisq, k=0)

hisq <- diff(hisq)
plot(hisq, type='l')
adf.test(hisq, k=0)
hi시가총액 <- hicf
hi종가

hinix_cf <- cbind(hi종가, hi고가, hi시가, hi시가총액, hi저가)
hinix_cf <- cbind(hinix_cf, ts(hinix$일자), ts(hinix$대비), ts(hinix$등락률), ts(hinix$거래량), ts(hinix$거래대금), ts(hinix$상장주식수))

sum(is.na(hinix_cf))
write.csv(hinix_cf, 'hinix_diff.csv')

