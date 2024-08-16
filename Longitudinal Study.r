library("gee")
library("geepack")
Data1=read.csv("20221013formatted_data-1.csv")
AllbmiT<-matrix(Data1$bmi,nrow=12)
AllBMI<-t(AllbmiT)
AlldementiaT<-matrix(Data1$dementia,nrow=12)
Alldementia<-t(AlldementiaT)
Alldata=data.frame(na.omit(cbind(Alldementia,AllBMI)))
Alldementia1=data.frame(Alldata[,1:12])
AllBMI1=data.frame(Alldata[,13:24])
colnames(AllBMI1) <- c("96BMI","98BMI",
                        "00BMI","02BMI",
                        "04BMI","06BMI",
                        "08BMI","10BMI",
                        "12BMI","14BMI",
                        "16BMI","18BMI")
colnames(Alldementia1) <- c("96d","98d",
                          "00d","02d",
                          "04d","06d",
                          "08d","10d",
                          "12d","14d",
                          "16d","18d")
#######Data demographic#####
length(which(Data1$RAGENDER==1))/12
length(which(Data1$RAGENDER==2&Data1$RARACEM==1))/12
length(which(Data1$RAGENDER==2&Data1$RARACEM==2))/12
length(which(Data1$RAGENDER==2&Data1$RARACEM==3))/12
length(which(Data1$RAGENDER==1&Data1$RARACEM==1))/12
length(which(Data1$RAGENDER==1&Data1$RARACEM==2))/12
length(which(Data1$RAGENDER==1&Data1$RARACEM==3))/12

####### Conduct dementia analysis with 2018 data ######
##y = 2018 Dementia status, x = 2018 BMI##
gee.2018_1=geeglm(Alldementia1$'18d' ~ AllBMI1$'18BMI', id=1:2756, family = binomial(link = logit), corstr = "independence")
summary(gee.2018_1)
gee.2018_1_2=geeglm(Alldementia1$'18d' ~ AllBMI1$'18BMI', id=1:2756, family = binomial(link = logit), corstr = "exchangeable")
summary(gee.2018_1_2)


##y = 2018 Dementia status, x = all past BMI##
data.2018=cbind(Alldementia1$'18d',AllBMI1)
gee.2018_2=geeglm(data.2018$`Alldementia1$"18d"`~. , id=1:2756, family = binomial(link = logit), corstr = "exchangeable",data=data.2018)
summary(gee.2018_2)
##y = 2018 Dementia status, X = recent 3 BMIs##
data.2018=cbind(Alldementia1$'18d',AllBMI1)
gee.2018_3=geeglm(data.2018$`Alldementia1$"18d"` ~ data.2018$'18BMI'+data.2018$'16BMI'+data.2018$'14BMI', id=1:2756, family = binomial(link = logit), corstr = "exchangeable",data=data.2018)
summary(gee.2018_3)
##y = 2018 Dementia status, X = change in BMI in last 4 years##
diff=(data.2018$'18BMI'-data.2018$'14BMI')
gee.2018_4=geeglm(data.2018$`Alldementia1$"18d"` ~ diff, id=1:2756, family = binomial(link = logit), corstr = "independence",data=data.2018)
summary(gee.2018_4)
##y = 2018 Dementia status, X = "positive" change in BMI in last 4 years##
data.2018.gain=data.2018[which((data.2018$"18BMI"-data.2018$"14BMI")>0),]
gain.2018=data.2018.gain$'18BMI'-data.2018.gain$'14BMI'
gee.2018_4_gain=geeglm(data.2018.gain$`Alldementia1$"18d"` ~ gain.2018, id=1:1046, family = binomial(link = logit), corstr = "independence",data=data.2018.gain)
summary(gee.2018_4_gain)

##y = 2018 Dementia status, X = "negative" change in BMI in last 4 years##
data.2018.loss=data.2018[which((data.2018$"18BMI"-data.2018$"14BMI")<0),]
loss.2018=data.2018.loss$'18BMI'-data.2018.loss$'14BMI'
gee.2018_4_loss=geeglm(data.2018.loss$`Alldementia1$"18d"` ~ loss.2018, id=1:1505, family = binomial(link = logit), corstr = "independence",data=data.2018.loss)
summary(gee.2018_4_loss)

####### Conduct dementia analysis with 2014 data ######
##y = 2014 Dementia status, x = 2014 BMI##
gee.2014_1=geeglm(Alldementia1$'14d' ~ AllBMI1$'14BMI', id=1:2756, family = binomial(link = logit), corstr = "exchangeable")
summary(gee.2014_1)
##y = 2014 Dementia status, x = all past BMI##
data.2014=cbind(Alldementia1$'14d',AllBMI1)
gee.2014_2=geeglm(data.2014$`Alldementia1$"14d"`~. , id=1:2756, family = binomial(link = logit), corstr = "independence",data=data.2014)
summary(gee.2014_2)
##y = 2014 Dementia status, X = recent 3 BMIs##
data.2014=cbind(Alldementia1$'14d',AllBMI1)
gee.2014_3=geeglm(data.2014$`Alldementia1$"14d"` ~ data.2014$'14BMI'+data.2014$'12BMI'+data.2014$'10BMI', id=1:2756, family = binomial(link = logit), corstr = "independence",data=data.2014)
summary(gee.2014_3)
##y = 2014 Dementia status, X = change in BMI in last 2 years##
diff14=(data.2014$'14BMI'-data.2014$'12BMI')
gee.2014_4=geeglm(data.2014$`Alldementia1$"14d"` ~ diff14 , id=1:2756, family = binomial(link = logit), corstr = "independence",data=data.2014)
summary(gee.2014_4)
##y = 2014 Dementia status, X = "positive" change in BMI in last 4 years##
data.2014.gain=data.2014[which((data.2014$"14BMI"-data.2014$"10BMI")>0),]
gain2014=data.2014.gain$'14BMI'-data.2014.gain$'10BMI'
gee.2014_4_gain=geeglm(data.2014.gain$`Alldementia1$"14d"` ~ gain2014, id=1:1156, family = binomial(link = logit), corstr = "independence",data=data.2014.gain)
summary(gee.2014_4_gain)
data.2014.loss=data.2014[which((data.2014$"14BMI"-data.2014$"10BMI")<0),]
loss2014=(data.2014.loss$'14BMI'-data.2014.loss$'10BMI')
gee.2014_4_loss=geeglm(data.2014.loss$`Alldementia1$"14d"` ~ loss2014, id=1:1335, family = binomial(link = logit), corstr = "independence",data=data.2014.loss)
summary(gee.2014_4_loss)

############Survival analysis############
library(MASS)
library(survival)
library(ggsurvfit)
library(ggplot2)
library(survminer)
library(tidyr)
library(eha)


Time1<-matrix(Data1$time,nrow=12)
Time<-2*(replace_na(Time1[1,],12))
#Time<-2*Time1[1,]

Survival.fail<-1-as.integer(is.na(Time1[1,]))
gender1<-matrix(Data1$RAGENDER,nrow=12)
gender<-gender1[1,]
race1<-matrix(Data1$RARACEM,nrow=12)
race<-race1[1,]


Survival<-data.frame(na.omit(cbind(AllBMI,Time,Survival.fail,gender,race)))

km_fit1<-survfit(Surv(Time,Survival.fail)~1,data=Survival)
ggsurvplot(km_fit1)
km_fit2<-survfit(Surv(Time,Survival.fail)~gender,data=Survival)
ggsurvplot(km_fit2, legend.labs=c("Male","Female"))
km_fit3<-survfit(Surv(Time,Survival.fail)~race,data=Survival)
ggsurvplot(km_fit3, legend.labs=c("White","African-American","Other"))
summary(km_fit1)

############ Cox model ############
cox.fit = coxph(Surv(Time,Survival.fail) ~., robust = TRUE, data = Survival)
summary(cox.fit)
Survival2=Survival[,1:14]
cox.fit2 = coxph(Surv(Time,Survival.fail) ~ Survival2$V10, robust = TRUE, data = Survival2)
summary(cox.fit2)
cox.fit3 = coxph(Surv(Time,Survival.fail) ~ Survival2$V10 + strata(gender), robust = TRUE, data = Survival)
summary(cox.fit3)
cox.fit4 = coxph(Surv(Time,Survival.fail) ~ race, robust = TRUE, data = Survival)
summary(cox.fit4)
cox.fit5 = coxph(Surv(Time,Survival.fail) ~ Survival2$V10 + strata(Survival$gender), robust = TRUE, data = Survival)
summary(cox.fit5)

diff3=Survival$V10-Survival$V8

cox.fit6 = coxph(Surv(Time,Survival.fail) ~ Survival2$V10 + strata(Survival$gender) + diff3 , robust = TRUE, data = Survival)
summary(cox.fit6)
cox.fit7 = coxph(Surv(Time,Survival.fail) ~ Survival2$V10 + strata(Survival$race) + diff3 , robust = TRUE, data = Survival)
summary(cox.fit7)



survdiff(Surv(Time,Survival.fail) ~., data = Survival2)
survdiff(Surv(Time,Survival.fail)~gender,data=Survival)
survdiff(Surv(Time,Survival.fail)~race,data=Survival)
