library(dplyr)
PATH <-"https://raw.githubusercontent.com/guru99-edu/R-Programming/master/computers.csv"
df <- read.csv(PATH) %>%
  select(-c(X, cd, multi, premium))
glimpse(df)

summary(df)

rescale_df <- df % > %
mutate(price_scal = scale(price),
         hd_scal = scale(hd),
         ram_scal = scale(ram),
         screen_scal = scale(screen),
         ads_scal = scale(ads),
         trend_scal = scale(trend)) % > %
  select(-c(price, speed, hd, ram, screen, ads, trend))


#R base has a function to run the k mean algorithm. The basic function of k mean is:


kmeans(df, k)



#Train the model

install.packages("animation")	

set.seed(2345)
library(animation)
kmeans.ani(rescale_df[2:3], 3)

pc_cluster <-kmeans(rescale_df, 5)
