#estimate US omicron mortality (1/7-4/7)

omi_mort_1_7 <- read.csv("~/Projects/Research/Mihir Projects/COVID-19 Model/omicron_deaths_1_7.csv", stringsAsFactors = FALSE)
omi_mort_4_7 <- read.csv("~/Projects/Research/Mihir Projects/COVID-19 Model/omicron_deaths_4_7.csv", stringsAsFactors = FALSE)

#filter out non-US areas (keep NYC,DC)
omi_mort_1_7 <- subset(omi_mort_1_7,!(state %in% c("AS","FSM","GU","MP","PR","PW","RMI","VI")))
omi_mort_4_7 <- subset(omi_mort_4_7,!(state %in% c("AS","FSM","GU","MP","PR","PW","RMI","VI")))

sum(omi_mort_4_7$tot_death) - sum(omi_mort_1_7$tot_death) #146361