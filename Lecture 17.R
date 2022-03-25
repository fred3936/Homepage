library(tidyverse)
library(gapminder)
install.packages("gridExtra")
library(gridExtra)

x1 <- c("Dec", "Apr", "Jan", "Jun")

x2 <- c("Dec", "Apr", "Jam", "Jun")

sort(x1)

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)

y1

sort(y1)

y2 <- factor(x2, levels = month_levels)
y2

y3 <- factor(x1)
y3

gapminder

str(gapminder$country)
levels(gapminder$continent) ## check levels
nlevels(gapminder$continent) ## check number of levels
class(gapminder$continent) 

gapminder %>%
  count(continent)

fct_count(gapminder$continent)  ## factor count

nlevels(gapminder$country)

h_countries <- c("Egypt","Haiti", "Romania")  

h_gap <- gapminder %>%
  filter(country %in% h_countries)

dim(h_gap)  
dim(gapminder)

nlevels(h_gap$country)
nlevels (h_gap$continent)

h_gap_dropped <- h_gap %>%
  droplevels()

nlevels(h_gap_dropped$country)
nlevels (h_gap_dropped$continent)


pop_gap <- gapminder %>%
  filter(pop < 250000)%>%
  mutate(country = fct_drop(country),
         continent = fct_drop(continent))

pop_gap_dropped <- gapminder %>%
  filter(pop < 250000)%>%
  droplevels()

gapminder$continent %>%
  fct_infreq()%>% ## order by frequency
  fct_rev()%>% ## reverse order of factor
  levels()

p1 <- gapminder %>%
  ggplot(aes(x=continent)) +
  geom_col()

p1 <- gapminder %>%
  ggplot(aes(x=fct_infreq(continent))) +
  geom_bar()

p2 <- gapminder %>%
  mutate(continent = fct_infreq(continent)) %>%
  ggplot(aes(x=continent)) +
  geom_bar()

grid.arrange(p1,p2, nrow=1)

gap_asia_2007 <- gapminder %>%
  filter(continent == "Asia", year=="2007")

p1 <- gap_asia_2007 %>%
  ggplot(aes(x=lifeExp,y=country))+
  geom_point()

p2 <- gap_asia_2007 %>%
  ggplot(aes(x=lifeExp,y=fct_reorder(country,lifeExp)))+
  geom_point()

p2 <- gap_asia_2007 %>%
  mutate(country = fct_reorder(country,lifeExp)) %>%
  ggplot(aes(x=country)) +
  geom_point()

grid.arrange(p1,p2,nrow=1)

h_countries
h_gap <-gapminder%>%
  filter(country%in% h_countries)
levels(h_gap$country)

  
p1<- ggplot(h_gap, aes(x=year, y=lifeExp, color=country)) +
  geom_line()

h_countries <- c("Egypt", "Haiti", "Romania", "Thailand", "Venezuela")
h_gap <- gapminder %>%
  filter(country %in% h_countries) %>% 
  droplevels()
ggplot(h_gap, aes(x = year, y = lifeExp, color = country)) +
  geom_line()
## reorder legend
ggplot(h_gap, aes(x = year, y = lifeExp,
                  color = fct_reorder2(country, year, lifeExp))) +
  geom_line() +
  labs(color = "country")

gap_asia_2007 %>%
  mutate(country= fct_reorder(country,gdpPercap)) %>%
  ggplot(aes(x=country, y=gdpPercap))+
  geom_point()+
  coord_flip()

# Pull out Thailand
gap_asia_2007 %>%
  mutate(country= fct_reorder(country,gdpPercap)) %>%
  ggplot(aes(x=fct_relevel(country,"Thailand"), y=gdpPercap))+
  geom_point()+
  coord_flip()


