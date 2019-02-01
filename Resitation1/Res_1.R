am <- read.csv("Desktop/Data-101/Resitation1/imports-85.data.csv")
View(am)
am$price (attributes)
#replace ? with NA
am$price[am$price == '?'] <- NA
typeof(am$price)
am$price <- as.numeric(am$price)
mn <- mean(am$price, na.rm = TRUE)  #REMOVE NA from column
am$price[is.na(am$price)] <- mn
hist(am$price)
boxplot(am$price~am$make)
am_make_table <- table(am$make)
barplot(am_make_table)
mosaicplot(am$make~am$fuel.type)
