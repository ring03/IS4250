library(ggplot2)
library(dplyr)

#correlation between SvcSat & WaitTime
ggplot(data=labs, aes(x=labs$WaitTime, fill=labs$SvcSat)) + geom_bar(stat= "count")

#calculate BMI
labs$BMI <- (labs$WT / (labs$HT^2))

#check BMI & TC correlation
lm <- lm(labs$BMI ~ labs$TC)
summary(lm)
#High R-squared value and small p-value suggests there is a correlation

#https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html
group_by(labs, Gender="M", ETHNIC = "C")
labs$TC <- as.numeric(labs$TC)
fit <- lm(BMI ~ AGE + SBP + TC, data = labs)
summary(fit)
newdata = data.frame(AGE = 45, SBP = 135, TC = 150)
prediction <- predict(fit, newdata)
prediction