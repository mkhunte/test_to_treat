#compute nursing home uptake over april and may
nursing_data <- read.csv("~/Projects/Research/Mihir Projects/COVID-19 Model/COVID-19 Nursing Home Data 06.26.2022.csv", stringsAsFactors = FALSE)

#impute 0 for missing therapeutic data (over April and May)
nurse_impute_apr_may <- subset(nursing_data,Week.Ending %in% c("04/03/22","04/10/22","04/17/22","04/24/22","05/01/22","05/08/22","05/15/22","05/22/22","05/29/22"))
nurse_impute_apr_may[is.na(nurse_impute_apr_may)] <- 0
nurse_impute_apr_may <- subset(nurse_impute_apr_may, !(Provider.State %in% c("PR","GU")))
sum(nurse_impute_apr_may$Number.of.Residents.with.a.New.Positive.COVID.19.Test.Result) #56563
sum(nurse_impute_apr_may[,63:64]) #7261
sum(nurse_impute_apr_may[,63:64])/sum(nurse_impute_apr_may$Number.of.Residents.with.a.New.Positive.COVID.19.Test.Result) #12.8%