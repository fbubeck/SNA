gss1985 <- haven::read_dta("Data/GSS1985.dta")
gss2004 <- haven::read_dta("Data/GSS2004.dta")

gss1985$numgiven

# Delete NAs
gss1985.complete <- gss1985 %>%
  filter(!is.na(numgiven))

gss2004.complete <- gss2004 %>%
  filter(!is.na(numgiven))


mean(gss1985.complete$numgiven)
mean(gss2004.complete$numgiven)

library("ggplot2")

#Korrelationen

#Satfin
cor.test(gss1985.complete$numgiven, gss1985.complete$satfin)

ggplot(data=gss1985.complete, aes(numgiven, satfin))+
  geom_jitter(alpha=.4)

plot(gss1985.complete$numgiven, gss1985.complete$satfin)

#happy
cor.test(gss1985.complete$numgiven, gss1985.complete$happy)

ggplot(data=gss1985.complete, aes(numgiven, happy))+
  geom_jitter(alpha=.4)

plot(gss1985.complete$numgiven, gss1985.complete$happy)

#hapmar
cor.test(gss1985.complete$numgiven, gss1985.complete$hapmar)

ggplot(data=gss1985.complete, aes(numgiven, hapmar))+
  geom_jitter(alpha=.4)

plot(gss1985.complete$numgiven, gss1985.complete$hapmar)
