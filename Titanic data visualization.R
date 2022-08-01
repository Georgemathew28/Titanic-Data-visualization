Titanic = read.csv("titanic.csv",stringsAsFactors = FALSE)
View(Titanic)

#check datatypes

str(Titanic)

#convert the datatypes

Titanic$sex = as.factor(Titanic$sex)
Titanic$pclass = as.factor(Titanic$pclass)
Titanic$survived = as.factor(Titanic$survived)
Titanic$embarked = as.factor(Titanic$embarked)


#import the library

library(ggplot2)

#survival details

ggplot(Titanic,aes(x=survived))+
  geom_bar()

ggplot(Titanic,aes(x=survived))+
  theme_classic()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count")

#Gender wise survival

ggplot(Titanic,aes(x=sex,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger Count",
       title = "Titanic Survival COunt by gender")

#survival based on class

ggplot(Titanic,aes(x=pclass,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count by class")

#Faceting Data
ggplot(Titanic,aes(x=sex,fill=survived))+
  theme_light()+
  facet_grid(~pclass)+
  geom_bar()+
  labs(y="Passenger Count",
       title = "Titanic Survival Count by class and gender")

#Trying pie chart

ggplot(Titanic,aes(x="",fill=survived))+
  geom_bar(position = "fill")+
  facet_grid(~pclass)+
  coord_polar(theta = "y")


#Lets the age group who dies onboard

ggplot(Titanic,aes(x=age))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y="passenger count",
       x="Age",
       title = "Titanic age distribution")

ggplot(Titanic,aes(x=survived,y=age))+
  theme_bw()+
  geom_boxplot()+
  labs(y="age",
       x="survived",
       title = "Titanic survival rate by age")

#facet and density plot
ggplot(Titanic,aes(x=age,fill=survived))+
  theme_bw()+
  facet_wrap(sex~pclass)+
  geom_density(alpha=0.5)+
  labs(y="age",
       x="survived",
       title="Titanic survival rate by age,class and gender")

