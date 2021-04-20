iris<-read.csv("Iris.csv")
View(iris)
table(iris$Species)

#scatterPlot
plot(iris$SepalLengthCm~iris$PetalLengthCm)
plot(iris$SepalLengthCm~iris$PetalLengthCm,xlab="Sepal Length",ylab="Petal Length",main="Sepal length Vs petal length",col="blue",pch=20)

#histogram
table(iris$Species)
hist(iris$SepalWidthCm)
hist(iris$SepalWidthCm,xlab = "Sepal Width",ylab="Numbers",col = "Red")

#boxplot
boxplot(iris$SepalLengthCm~iris$Species)
boxplot(iris$SepalLengthCm~iris$Species,xlab="Species",ylab="sepal length",main="various species",col="burlywood")

#housesGGplot
house<-read_xlsx("houses.xlsx")
View(house)
house<-house%>%select(c(-1))
library(ggplot2)
ggplot(data=house,aes(x=price))+geom_histogram(binns=50,fill="green",col="palegreen")

#position(filler in aestehtics)
ggplot(data=house,aes(x=price,fill=air_cond))+geom_histogram(position="fill")


#bar_plot
ggplot(data = house,aes(x=waterfront,fill=sewer))+geom_bar(position="fill")

#frequency_polygon
ggplot(data=house,aes(x=price,col=air_cond))+geom_freqpoly(bins=60)

#boxplot
ggplot(data = house,aes(x=factor(rooms),y=price))+geom_boxplot()
ggplot(data = house,aes(x=factor(rooms),y=price,fill=factor(rooms)))+geom_boxplot()
ggplot(data = house,aes(x=factor(rooms),y=price,fill=air_cond))+geom_boxplot()
ggplot(data = house,aes(x=factor(rooms),y=price,fill=sewer))+geom_boxplot()      

#smoothline(one continus is how related to anotehr continous var)       
ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_smooth()
ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_smooth(se=F)

#using method "lm" in smooth
ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_point()+geom_smooth(method="lm",se=F)

#faceting

ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~air_cond)
ggplot(data = house,aes(y=price,x=living_area,factor(fireplace)))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~air_cond)
ggplot(data = house,aes(y=price,x=age,factor(fireplace)))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~air_cond)

#theme-1
ggplot(data = house,aes(x=factor(rooms),y=price,fill=factor(rooms)))+geom_boxplot()
ggplot(data = house,aes(x=factor(rooms),y=price,fill=factor(rooms)))+geom_boxplot()->t1
t1+labs(title = "Price wrt rooms",x="Rooms",fill="Rooms")->t2
t2+theme(panel.background = element_rect(fill="palegreen"))
t2+theme(panel.background = element_rect(fill="palegreen"))->t3
t3+theme(plot.title = element_text(hjust=0.5,face="bold",colour = "black"))->t4
t4+scale_y_continuous(labels = dollar)

#theme2
ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~air_cond)
ggplot(data = house,aes(y=price,x=living_area,col=air_cond))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~air_cond)->g1
g1+theme(panel.background = element_rect(fill="palegreen1"))->g2
g2+theme(legend.background = element_rect(fill="red"))->g3
g3+theme(plot.background = element_rect(fill="lightcoral"))

#theme-03
ggplot(data = house,aes(x=price,col=air_cond))+geom_freqpoly(size=1,bins=60)->a1
a1+theme(panel.background = element_rect(fill = "peachpuff"))->a2
a2+labs(title = "Frequency polygon for price")->a3
a3+theme(plot.title = element_text(hjust = 0.5))->a4
a4+theme(plot.background = element_rect("pink"))
