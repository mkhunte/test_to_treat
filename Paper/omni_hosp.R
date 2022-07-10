#compute Covid hospitalizations (12/15-3/15)

hosp <- read.csv("../data/covid-hospitalizations.csv")

us_hosp <- subset(hosp, entity=="United States" & indicator == "Weekly new hospital admissions")

#pick out weekly hospital admissions on 12/21, 12/28, 1/4, 1/11, 1/18, 1/25, 2/1, 2/8, 2/15,
#2/22, 3/1, 3/8, 3/15
us_hosp$date <- as.Date(us_hosp$date)
covid_hosp <- subset(us_hosp, date >= as.Date("2021-12-21") & date <= as.Date("2022-3-15"))

hosp_count <- 0

for (i in 1:13){
  date_num <- 7*i-6
  hosp_count <- hosp_count + covid_hosp$value[date_num]
}

#There are a total of 1,062,119 hospitalizations from 12/15-3/15
