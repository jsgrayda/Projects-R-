#open file
mydata = read.csv('covid_19_data.csv')

#view data
head(mydata)

#get info
str(mydata)

#select only US data and view
US_only <- subset(mydata, Country.Region == 'US')
head(US_only)
#last reported case: 5/30/2020

#the variables I want to use are Confirmed, Deaths, Recovered
#and the x-axis would be observation date

#ggplot(data = US_only, aes(x = ObservationDate))+
  #geom_line(aes(y = Confirmed, color = 'black'))+
  #geom_line(aes(y = Deaths, color = 'red'))+
  #geom_line(aes(y = Recovered, color = 'black'))

#plot confirmed cases and recovered patients in the US
US_confirmed_recovered <- ggplot(data = US_only, aes(x = ObservationDate))+
  geom_line(aes(y = Confirmed), color = 'black')+
  geom_line(aes(y = Recovered), color = 'green')+
  ggtitle('COVID-19 in the US')+
  ylab('Number of Observations Reported') + xlab('Observation Date')

#plot confirmed cases and deaths in the US
US_confirmed_deaths <- ggplot(data = US_only, aes(x = factor(ObservationDate)))+
  geom_line(aes(y = Confirmed), colour = 'black')+
  geom_line(aes(y = Deaths), colour = 'red')+
  labs(title='COVID-19 in the US', subtitle='The number of cases (black) and deaths (red) as of 5/30/2020', 
       y='Number of Observations Reported', x='Time Elapsed',
       caption='Source: Kaggle.com/novel-corona-virus-2019-dataset')+
  scale_x_discrete(breaks=seq(01/22/2020, 5/30/2020, 10))

US_confirmed_deaths <- US_confirmed_deaths + theme(plot.title = element_text(size=25),
                                                  axis.title.y = element_text(size = 17),
                                                  axis.title.x = element_text(size = 17))

