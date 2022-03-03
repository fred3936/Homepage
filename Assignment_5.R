housing <- read_csv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/landdata_states.csv")
housing %>%
  head() %>% 
  kable() 



housing$region <- ifelse(housing$State == "DC" & is.na (housing$region), "South", housing$region)

housing_DC <- housing %>%
  filter(State == "DC") %>% 
  select(region, State, Land.Value,Date) %>% 
  head(6) 

view(housing_DC)


housing_DC <- housing %>%
  mutate(region = case_when(housing$State == "DC" & is.na (housing$region) ~ "South"))

iris2$Species <- ifelse(iris2$Species=='setosa', 'regular', iris2$Species)

housing %>%
  select(region, State, Date, Land.Value) %>%
  mutate(
    region = ,
    mass2_squared = mass2 * mass2
  )
