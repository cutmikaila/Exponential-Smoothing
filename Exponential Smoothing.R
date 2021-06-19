export <- read.delim("Data Export.txt")
view(export)
str(export)
#Membentuk data ke dalam bentuk time series
expo<-(export$Export)
expo
expo_ts<-ts(expo,start=c(2006,1),frequency = 12)
expo_ts
#Menampilkan plot time series data
win.graph()
plot(expo_ts)
#Exponential Smoothing
# 1. Seasonal Additive Holt-Winters (Triple Exponential Additive)
# Untuk Data dengan pola musiman dengan varians yang stationer
# menerapkan Holt-Winters aditif (default)
model1 <-HoltWinters(expo_ts)
model1
fore1 <-predict(model1, 25, prediction.interval = TRUE)
fore1
# 2. Seasonal Multiplicative Holt-Winters (Triple Exponential Multiplicative)
# Untuk Data dengan pola musiman dengan varians yang TIDAK stationer
model2 <-HoltWinters(expo_ts, seasonal="mult")
fore2 <-predict(model2, 25, prediction.interval = TRUE)
model2
fore2
win.graph()
plot(model2,fore2)
win.graph()
plot(fitted(model2))
plot(fitted(model2))
model2$SSE
# 3. Non-Seasonal Holt-Winters (Double Exponential
# Untuk Data yang tidak mengandung pola musiman, hanya mengandung trend
x <-expo_ts + rnorm(expo_ts, sd = 5) # error N(0,5) ditambahkan ke da
ta export
x <-expo_ts
model3 <-HoltWinters(x, gamma = FALSE)
fore3 <-predict(model3, 25, prediction.interval = TRUE) 
model3
fore3
model3$SSE
plot(model3,fore3)
plot(fitted(model3))
# Exponential Smoothing (Single Exponential)
# Exponential Smoothing (Single Exponential)
x <-expo_ts
model4 <-HoltWinters(x, gamma = FALSE, beta = FALSE)
fore4 <-predict(model4, 25, prediction.interval = TRUE)
model4
fore4
model4$SSE
win.graph()
plot(model4,fore4)
win.graph()
plot(fitted(model4))



