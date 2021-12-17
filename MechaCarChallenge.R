library(dplyr)

# Read in the MechaCar_mpg.csv file
mechacar <- read.csv(file="MechaCar_mpg.csv")

# Perform linear regression
reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar)

# Summarize linear model
summary(reg)

# Read in the Suspension_Coil.csv file
suspension <- read.csv(file="Suspension_Coil.csv")

# Create total summary
total_summary <- suspension %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Create lot summary
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Perform t-test on all manufacturing lots
t.test(suspension$PSI, mu=1500)

# Perform t-test on manufacturing lot1
t.test(PSI ~ 1, data=suspension, subset=Manufacturing_Lot=='Lot1', mu=1500)

# Perform t-test on manufacturing lot2
t.test(PSI ~ 1, data=suspension, subset=Manufacturing_Lot=='Lot2', mu=1500)

# Perform t-test on manufacturing lot3
t.test(PSI ~ 1, data=suspension, subset=Manufacturing_Lot=='Lot3', mu=1500)
