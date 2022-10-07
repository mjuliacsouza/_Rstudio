state <- read.csv(file="Programação/_Rstudio/state.csv", sep=';', stringsAsFactors=FALSE)
state

# analyzing dataset
print(is.data.frame(state))
print(ncol(state))
print(nrow(state))
max_pop = max(state$Populacao)
estado_max_pop = subset(state, Populacao == max_pop)
estado_max_pop

# mean and median
mean(state[['Populacao']])
mean(state[['Populacao']], trim=0.1)
median(state[['Populacao']])

# standard deviation
sd(state[['Populacao']])
IQR(state[['Populacao']])
##mad(state[['Populacao']])

# percents and boxplot
quantile(state[['TaxaHomicidio']], p=c(.05,.25,.5,.75,.95))
boxplot(state[['Populacao']]/1000000, ylab='Populacao (milhao)')

# frequency table
breaks <- seq(from=min(state[['Populacao']]), 
              to=max(state[['Populacao']]), length=11)
pop_freq <- cut(state[['Populacao']], breaks=breaks, 
                right=TRUE, include.lowest=TRUE)
table(pop_freq)

#histogram
hist(state$TaxaHomicidio, freq=FALSE)
lines(density(state$TaxaHomicidio), lwd=6, col='blue')

