# caret 
# A short introduction to the caret package (by Max Kuhn) 
# https://cran.r-project.org/web/packages/caret/vignettes/caret.pdf

library(caret)
library(mlbench)
data(Sonar)
set.seed(107)
inTrain = createDataPartition(y=Sonar$Class, p=.75, list=F)
training = Sonar[inTrain,]
testing = Sonar[-inTrain,]
ctrl = trainControl(method = "cv", number = 10, 
                    summaryFunction = twoClassSummary, 
                    classProbs = TRUE
                    )
plsFit = train(Class~.,
               data = training,
               metric = "ROC",
               trControl = ctrl,
               tuneLength = 15,
               method = "pls",
               preProc = c("center", "scale")
               ) 
# trControl to customize the type of resampling (and performance measures), 
# tuneLength or tuneGrid to customize tuning parameters
# metric to specify performance measures 
plsFit
plot(plsFit)
plsClasses = predict(plsFit, newdata = testing)
plsProbs = predict(plsFit, newdata = testing, type = "prob")
confusionMatrix(plsClasses, testing$Class)
caTools::colAUC(plsProbs, testing$Class, plotROC=TRUE)

rdaGrid = expand.grid(gamma = (0:4)/4, lambda = seq(0,1,length=10))
# gamma; balance btw LDA and QDA, gamma = 0; equal to LDA
rdaFit <- train(Class ~ .,
                  data = training,
                  method = "rda",
                  tuneGrid = rdaGrid,
                  trControl = ctrl,
                  metric = "ROC")
rdaFit
plot(rdaFit)
rdaClasses = predict(rdaFit, newdata = testing)
rdaProbs = predict(rdaFit, newdata = testing, type = "prob")
confusionMatrix(rdaClasses, testing$Class)
caTools::colAUC(rdaProbs, testing$Class, plotROC = T)

resamps = resamples(list(pls = plsFit, rda = rdaFit))
summary(resamps)
bwplot(resamps)
xyplot(resamps)

diffs = diff(resamps) # paired t-test; performance metrics for each resample 
summary(diffs)


