library(formattable)
library(dplyr)
library(ggpubr)

my_iris_dataframe <- data.frame(iris)
levels(my_iris_dataframe$Species)
head(my_iris_dataframe, 2)
str(my_iris_dataframe)
summary(my_iris_dataframe)
filter(my_iris_dataframe,Species=="virginica")
my_flower_table <- filter(my_iris_dataframe,Species=="virginica")
count(my_flower_table)
filter(my_iris_dataframe,Species=="virginica") %>% count()
select(my_iris_dataframe, Sepal.Length, Sepal.Width, Species) %>%
  filter(Species=="virginica" & Sepal.Length<6 & Sepal.Width<=2.7)
head(arrange(my_iris_dataframe, Sepal.Length, desc(Sepal.Width)), 8)

my_iris_dataframe %>%
  group_by(Species) %>%
  summarise (
    mean_petal_length =  mean(Petal.Length),
    mean_sepal_length = mean(Sepal.Length),
    median_sepal_width = median(Sepal.Width),
    median_pedal_width = median(Petal.Width)
  )

complex_query <- my_iris_dataframe %>%
  group_by(Species) %>%
  summarise (
    mean_petal_length =  mean(Petal.Length),
    mean_sepal_length = mean(Sepal.Length),
    median_sepal_width = median(Sepal.Width),
    median_pedal_width = median(Petal.Width)
  )

formattable(complex_query)

plot_species_length <- ggviolin(my_iris_dataframe,
                                x = "Species",
                                y = "Sepal.Length",
                                fill = "Species",
                                palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                                add = "boxplot", add.params = list(fill='white')
)

plot_species_length