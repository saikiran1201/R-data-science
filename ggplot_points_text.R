library(ggplot2)
library(dplyr)
#filtering data frame
dat = read.csv("P2-Demographic-Data.csv")
View(dat)
str(dat)

#row will always be data frame
dat[1:5,]
dat[1,]
#colunm may not be
dat[,1:2]

dat[,1]

is.data.frame(dat[,1])
typeof(dat[,1])
#to remain it in df
dat[,1,drop=F]
is.data.frame(dat[,1,drop=F])
typeof(dat[,1,drop=F])


#adding a column to Df
dat$mycolumn = dat$Internet.users*dat$Income.Group
View(dat)

#remove mycolumn
dat$mycolumn = NULL
View(dat)


#filtering with dplyr
new_data = filter(dat, Internet.users < 2)
View(new_data)

new_arrange = arrange(new_data, Internet.users)

View(new_arrange)

#without dplyr package
birth_rate_less40 = dat$Birth.rate > 40
birth_rate_less40
dat[birth_rate_less40,]

dat[dat$Internet.users < 2 & dat$Birth.rate > 40,]

dat[dat$Income.Group == "High income",]
dat[dat$Country.Name == "India",]

View(dat)
#qplot

qplot(x=Internet.users,y=Birth.rate,data=dat,color=Income.Group,size=I(3))



#asian countries
asian = c("Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Burma", "Cambodia", "China", "East Timor", "Hong Kong", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Laos", "Lebanon", "Malaysia", "Mongolia", "Nepal", "North Korea", "Oman", "Pakistan", "Papua New Guinea", "Philippines", "Qatar", "Russia", "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Syria", "Taiwan", "Tajikistan", "Thailand", "Turkey", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Vietnam", "Yemen")
asian[48]
asian_countries = filter(dat, Country.Name %in% asian)
View(asian_countries)
str(asian_countries)
plot = ggplot(asian_countries, aes(x=Internet.users,y=Birth.rate, cex=I(6))) + geom_point()

plot

plot + facet_grid(Income.Group ~ .) + geom_text(aes(label=Country.Code),hjust=1, vjust=0)

indian_neighbouring = c("India","Bangladesh","Bhutan", "China", " Myanmar", "Nepal", "Pakistan", "Afghanistan", "Sri Lanka")
indian_countries_neighbour = filter(dat, Country.Name %in% indian_neighbouring)
plot = ggplot(indian_countries_neighbour, aes(x=Internet.users,y=Birth.rate, cex=2)) + geom_point()
plot
plot + facet_grid(Income.Group ~ .) + geom_text(aes(label=Country.Name),hjust=1, vjust=0)
#text(indian_countries_neighbour$Country.Name, labels=Country.Name, cex= 0.7, pos=3)
head(indian_countries_neighbour)
tail(indian_countries_neighbour)



