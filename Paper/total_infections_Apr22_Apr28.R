
data22_org <- read.csv("../data/covid19_infection_estimate_2022.csv")
data22 <- data22_org[data22_org$location_name == 'United States of America', ]

data22$date <- as.Date(data22$date)

data22_April <- data22[data22$date >= "2022-4-22" & data22$date <= "2022-4-28", ]

sum(data22_April$inf_mean)
