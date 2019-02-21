mydata <- read.csv('CENSUSNEW.csv')
View(mydata)
#No.1  China VS. USA
mydata$NATIVE
mydata$NATIVE[mydata$NATIVE == '?'] <- NA
country.gainavg<-tapply(mydata$YEARS,mydata$NATIVE,mean)
country.gainavg
barplot(country.gainavg)


boxplot(mydata$YEARS[mydata$NATIVE=="China"],mydata$YEARS[mydata$NATIVE=="United-States"],col=c("red", "blue"),names=c("China","USA"), ylab="Years of Study")


edu.china <- subset(mydata, NATIVE == 'China')
edu.usa <- subset(mydata, NATIVE == 'United-States')
mean.C <- mean(edu.china$YEARS)
mean.U <- mean(edu.usa$YEARS)
st.C <- sd(edu.china$YEARS)
st.U <- sd(edu.usa$YEARS)

len_C <- length(edu.china$YEARS)
len_U <- length(edu.china$YEARS)

st.C.U <- sqrt(st.C^2/len_C + st.U^2/len_U)

zeta <- (mean.C - mean.U)/st.C.U
zeta
p <- 1-pnorm(zeta)
p

#CHINESES have better education than AMERICANS
#Null hypothsisi:CHINESE HAS SAME EDUCATION AS AMERICANS

#No. 2 Age and education relationship
boxplot(mydata$YEARS)
education <- cut(mydata$YEARS,breaks=c(0,4,8,12,16),labels=c( "Poor Educated", "Normal Educated", "Well Educated", "Deeply Educated"))
mydata$Year_cate <- education
range <- table(mydata$Year_cate)
boxplot(mydata$AGE~mydata$Year_cate)
#Pool educated people age older than people who got deeply educated
#Null hypothsisi: people who have poor education age same as the one who got deep education
edu.PE<-subset(mydata, Year_cate=='Poor Educated')
edu.DE<-subset(mydata, Year_cate=='Deeply Educated')
mean.pe <- mean(edu.PE$AGE)
mean.de <- mean(edu.DE$AGE)
st.pe <- sd(edu.PE$AGE)
st.de <- sd(edu.DE$AGE)

len_pe <- length(edu.PE$AGE)
len_de <- length(edu.DE$AGE)

st.pe.de <- sqrt(st.pe^2/len_pe + st.de^2/len_de)

zeta <- (mean.pe - mean.de)/st.pe.de
zeta
p <- 1-pnorm(zeta)
p
