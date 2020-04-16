
#inserting data

sales <- read.csv("C:/Users/ASUS/Desktop/PR Lab/a1/yearly_sales.csv")
head(sales)
summary(sales)

#plotting graph

plot(sales$num_of_orders,sales$sales_total,
     main = "Number of Orders vs. Sales")

results <- lm(sales$sales_total ~ sales$num_of_orders)
summary(results)

hist(results$residuals, breaks = 800)

#writing to new file

df <- read.csv("C:/Users/ASUS/Desktop/PR Lab/a1/yearly_sales.csv")
print (df)

write.csv(df,"C:/Users/ASUS/Desktop/PR Lab/a1/write.csv", row.names = FALSE)

#vector 

vector <- read.csv('C:/Users/ASUS/Desktop/PR Lab/a1/write.csv')

v1 <- vector[[1]]  # by column number
v2 <- vector[["cust_id"]]  # by column name
v3 <- vector$cust_id  # by column name

print (v3)

#Arrays

result <- array(c(v3),dim = c(3,3,2))
print(result)


#matrix

mat <- as.matrix(df)
class(mat)
str(mat)
nrow(mat)
ncol(mat)
mat[1, 1]
mat[1:4, 1:2]

