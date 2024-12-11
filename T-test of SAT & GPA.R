
pj3data2<-read_xls("sat.xls")


#Histogram

ggplot()+
  geom_histogram(data= pj3data2,
                 aes(x=high_GPA, y=..density..),
                 binwidth = 1, color="black", fill="lightblue")+
  geom_density(data= pj3data2,
               aes(x=high_GPA), color="sienna1", size=1)

ggplot() +
  geom_histogram(data = pj3data2,
                 aes(x = univ_GPA, y = ..density..),
                 binwidth = 1, color = "black", fill = "lightblue") +
  geom_density(data = pj3data2,
               aes(x = univ_GPA), color = "sienna1", size = 1)

##create boxplots

boxplot(pj3data2$high_GPA, pj3data2$univ_GPA,names=c("high_GPA","univ_GPA"))


#Q-Q Plots
qqnorm(pj3data2$high_GPA)
qqline(pj3data2$high_GPA)

qqnorm(pj3data2$univ_GPA)
qqline(pj3data2$univ_GPA)

#transformation
high_GPA_trans<-transformTukey(HS_GPA)

univ_GPA_trans<-transformTukey(Univ_GPA)


# paired t-test

t.test(high_GPA_trans,univ_GPA_trans, paired = TRUE, var.equal = FALSE, alternative = "greater")
