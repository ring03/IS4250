fertility_training <- fertility_data

library(caret)

rf_model<-train(Output~.,data=fertility_training,method="rf",
                 trControl=trainControl(method="cv",number=10),
                 prox=TRUE,allowParallel=TRUE)
print(rf_model)
print(rf_model$finalModel)
plot(varImp(rf_model), top = 5)
testdata <- data.frame (Season = 1, Age = 0.65, ChiDiseases = 1, Accident = 0, Surgery = 0, HighFever = 1, FreAlcohol = 0.6, Smoking = 0, HrSitting = 0.50)
prediction<- predict(rf_model, newdata = testdata)
print(prediction)
