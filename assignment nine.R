df = read.csv("/Users/sarahdippolito/Desktop/Affairs.csv")
df$gender <- as.factor(df$gender)
#Base R
plot(df$age, df$yearsmarried, 
     main = "Years Married Vs Age", 
     xlab = "Age", 
     ylab = "Years Married", 
     col = colors)
legend("bottomright", 
       legend = unique(df$gender), 
       fill = c("blue", "pink"), 
       title = "Gender")
#Lattice
library(lattice)
xyplot(yearsmarried~age,data=df,
       groups = gender,
       main="Years Married vs Age",
       xlab="Age",
       ylab="Years Married",
       auto.key = TRUE,
       par.settings = list(superpose.symbol = list(col = c("pink","blue"),
                                                  pch = 1)))
#ggplot2
library(ggplot2)
(ggplot(df, aes(x=age, y=yearsmarried, col=gender))
+geom_point()+theme_bw()
+labs(xlab="Age", ylab="Years Married", title="Years Married vs Age"))


