source('dependencies.R')

global <- read.csv(file="extract/global.csv", header=TRUE, sep=",")
raleigh <- read.csv(file="extract/raleigh.csv", header=TRUE, sep=",")

global %<>%
  select(year, avg_gtemp = avg_temp, mov_avg_gtemp = mov_avg_temp)

raleigh %<>%
  select(year, avg_temp, mov_avg_temp)

data <- full_join(global, raleigh)

global <- NULL
raleigh <- NULL

vis <- ggplot(data, aes(x = year)) +
  geom_line(aes(y = mov_avg_gtemp, color = "global_temps")) +
  geom_line(aes(y = mov_avg_temp, color = "raleigh_temps")) +
  ylab(label="Rolling Average Temperature in Celsius") +
  xlab("Year") +
  labs(title="Comparing Raleigh Average Temperature to the Global Average") +
  scale_colour_manual("",
                      values = c("global_temps"="red", "raleigh_temps"="blue"))