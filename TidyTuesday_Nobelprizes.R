#TidyTuesday
#Nobel prices

#Load libraries
library(dplyr)
library(tidyr)
library(RColorBrewer)
library(ggplot2)
library(extrafont)

#Load data
data <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-05-14/nobel_winners.csv")

#Filter only females
data1 <- data %>%
  filter(gender=="Female")

#Add a column
data1["count"] <- 1

#Aggregate: sum winners per category
data2 <- data1 %>%
  group_by(gender,category) %>% 
  mutate(count=n())

#Make soms colours
mycolors <- c("#330244","#0050B6","#250462","#003E38", "#007067","#56416F")

#GGplot: barchart
p <- ggplot(data=data2, aes(x=category)) + 
  geom_bar(aes(fill=category), width = 0.8)+
  scale_fill_manual(values = mycolors)+
  coord_polar()+
  labs(title="TidyTuesday: Female Nobel Prize Winners", 
       subtitle="Number of Female Winners since first winner in 1903",
       x="", 
       y="",
       caption="Source: Kaggle | Plot by @sil_aarts")+
  theme_minimal(10) +
  theme(legend.position = "none",
        panel.background = element_rect(fill = 'grey25'),
        plot.title=element_text(size=14, hjust=0.2, family="Courier New",face='bold'),
        plot.subtitle=element_text(size=12, hjust=0.2, family="Courier New"),
        plot.caption=element_text(size=10, hjust=0.2,family="Courier New"),
        axis.text.x = element_text(size=10, family="Courier", face="bold", colour="white"),
        axis.text.y = element_text(size=9, family="Courier", face="bold", colour="black"),
        axis.title.x = element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y= element_blank(),
        axis.ticks.x= element_blank())


#Run it!
p
