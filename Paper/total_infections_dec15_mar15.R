data21_org <- read.csv("covid19_infection_estimate_2021.csv")
data22_org <- read.csv("covid19_infection_estimate_2022.csv")

data21 <- data21_org[data21_org$location_name == 'United States of America', ]
data22 <- data22_org[data22_org$location_name == 'United States of America', ]

data21$date <- as.Date(data21$date)
data22$date <- as.Date(data22$date)

data21 <- data21[data21$date >= "2021-12-15", ]
data22 <- data22[data22$date <= "2022-3-15", ]

columns = c("date", "inf_mean")

mean(rbind(data21[, columns], data22[, columns])$inf_mean)
sum(rbind(data21[, columns], data22[, columns])$inf_mean)