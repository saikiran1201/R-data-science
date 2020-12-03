
library(ggplot2)
library(dplyr)
theUrl <- "http://vincentarelbundock.github.io/Rdatasets/csv/reshape2/tips.csv"
tips <- read.csv(file = theUrl, header = TRUE, sep = ",")
View(tips)
#it already have an index in the first column so let's remove that.

tips$X <- NULL
head(tips)

plot = ggplot(tips, aes(x=total_bill/size,y=tip/size,color = smoker,cex=I(4))) + geom_point()

plot

plot + facet_grid(sex ~ .)

plot + facet_grid(. ~ sex)


plot + facet_grid(day ~ sex)


plot + facet_grid(sex  ~ day)

plot + facet_wrap( ~ day, ncol=2)

plot + facet_grid(sex ~ day) +
  theme(strip.text.x = element_text(size=8, angle=75),
        strip.text.y = element_text(size=12, face="bold"),
                strip.background = element_rect(colour="red", fill="#CCCCFF"))


labels <- c(Female = "Women", Male = "Men")
plot + facet_grid(. ~ sex, labeller=labeller(sex = labels))



# A histogram of bill sizes
hp <- ggplot(tips, aes(x=total_bill)) + geom_histogram(binwidth=2,colour="white")
hp
# Histogram of total_bill, divided by sex and smoker
hp + facet_grid(sex ~ smoker)

# Same as above, with scales="free_y"
hp + facet_grid(sex ~ smoker, scales="free_y")

# With panels that have the same scaling, but different range (and therefore different physical sizes)
hp + facet_grid(sex ~ smoker, scales="free", space="free")
















