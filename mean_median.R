state <- read.csv(file="Programação/_Rstudio/state.csv", sep=';', stringsAsFactors=FALSE)
state
mean(state[['Populacao']])
mean(state[['Populacao']], trim=0.1)
median(state[['Populcao']])
