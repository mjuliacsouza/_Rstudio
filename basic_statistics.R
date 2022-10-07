state <- read.csv(file="Programação/_Rstudio/state.csv", sep=';', stringsAsFactors=FALSE)
state

# analyzing dataset
print(is.data.frame(state))
print(ncol(state))
print(nrow(state))
max_pop = max(state$Populacao)
estado_max_pop = subset(state, Populacao == max_pop)
estado_max_pop

# metrics
mean(state[['Populacao']])
mean(state[['Populacao']], trim=0.1)
median(state[['Populacao']])
