install.packages("tidyverse")
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")
library("here")
library("tidyverse")
library('janitor')
library('skimr')
library('dplyr')

setwd("/Users/17186/Desktop/Bella Beats")

dailyCalories_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/dailyCalories_merged.csv")
dailyIntensities_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/dailyIntensities_merged.csv")
dailySteps_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/dailySteps_merged.csv")
heartrate_seconds_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/heartrate_seconds_merged.csv")
minuteMETsNarrow_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/minuteMETsNarrow_merged.csv")
sleepDay_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/sleepDay_merged.csv")
weightLogInfo_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/weightLogInfo_merged.csv")
dailyActivity_merged <- read.csv("C:/Users/17186/Desktop/Bella Beats/dailyActivity_merged.csv")


head(dailyCalories_merged)
colnames(dailyCalories_merged)

head(dailyIntensities_merged)
colnames(dailyIntensities_merged)

head(dailySteps_merged)
colnames(dailySteps_merged)


head(heartrate_seconds_merged)
colnames(heartrate_seconds_merged)

head(minuteMETsNarrow_merged)
colnames(minuteMETsNarrow_merged)

head(sleepDay_merged)
colnames(sleepDay_merged)


head(weightLogInfo_merged)
colnames(weightLogInfo_merged)


head(dailyActivity_merged)
colnames(dailyActivity_merged)


install.packages("sqldf")
library (sqldf)

daily_activity_2 <-dailyActivity_merged %>% 
select(Id, ActivityDate, Calories)
head(daily_activity_2)

sql_check <- sqldf('SELECT* FROM daily_activity_2 INTERSECT SELECT * FROM dailyCalories_merged')
head(sql_check)

daily_activity_3 <-dailyActivity_merged %>% 
  select(Id, ActivityDate, SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes,VeryActiveMinutes,SedentaryActiveDistance,LightActiveDistance,ModeratelyActiveDistance,VeryActiveDistance)
head(daily_activity_3)

nrow(sql_check)


sql_check2 <- sqldf('SELECT* FROM daily_activity_3 INTERSECT SELECT * FROM dailyIntensities_merged')
head(sql_check2)
nrow(sql_check2)



daily_activity_4 <-dailyActivity_merged %>% 
  select(Id, ActivityDate,TotalSteps)
head(daily_activity_4)


sql_check3 <- sqldf('SELECT* FROM daily_activity_4 INTERSECT SELECT * FROM dailySteps_merged')
head(sql_check3)
nrow(sql_check3)


n_distinct (dailyActivity_merged$Id)
n_distinct (dailyCalories_merged$Id)
n_distinct (dailyIntensities_merged$Id)
n_distinct (dailySteps_merged$Id)
n_distinct (heartrate_seconds_merged$Id)
n_distinct (minuteMETsNarrow_merged$Id)
n_distinct (sleepDay_merged$Id)
nrow(dailyActivity_merged)
nrow(heartrate_seconds_merged)
nrow(minuteMETsNarrow_merged)
nrow(sleepDay_merged)
nrow(weightLogInfo_merged)


dailyActivity_merged%>%
  select (TotalSteps,TotalDistance,SedentaryMinutes,LightlyActiveMinutes,FairlyActiveMinutes,VeryActiveMinutes,Calories)%>%
  summary()

heartrate_seconds_merged%>%
  select (Value)%>%
  summary()

minuteMETsNarrow_merged%>%
  select (METs)%>%
  summary()

sleepDay_merged%>%
  select (TotalSleepRecords,TotalMinutesAsleep,TotalTimeInBed)%>%
  summary()

weightLogInfo_merged%>%
  select (WeightPounds, BMI)%>%
  summary()

ggplot(data=dailyActivity_merged, aes(x=VeryActiveMinutes, y=Calories)) +geom_point()+stat_smooth(method=lm)+ labs(title="The relationship beteween Very Active Minutes and Total Daily Calories Burned")

ggplot(data=dailyActivity_merged, aes(x=TotalDistance, y=Calories)) +geom_smooth()+ labs(title="The relationship beteween Total Distance and Total Daily Calories Burned")

ggplot(data=sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) +geom_point()+stat_smooth(method=lm)+ labs(title="The relationship beteween Total Minutes Asleep and Total Daily Calories Burned")

