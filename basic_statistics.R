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
boxplot(state[['Populacao']]/1000000, ylab='Populacao (milhao)', main='Boxplot da populacao')

# frequency table
breaks <- seq(from=min(state[['Populacao']]), 
              to=max(state[['Populacao']]), length=11)

pop_freq <- cut(state[['Populacao']], breaks=breaks, 
                right=TRUE, include.lowest=TRUE)
table(pop_freq)

#histogram
hist(state$TaxaHomicidio, freq=FALSE, main='Histograma da Taxa de Homicidio')
lines(density(state$TaxaHomicidio), lwd=6, col='blue')

# teorema central do limite
library(ggplot2)
head(ChickWeight)
length(ChickWeight)
samp_data <- data.frame(income=sample(ChickWeight$weight,20), type='data_dist')
samp_mean_05 <- data.frame(income=tapply(sample(ChickWeight$weight, 20*5), 
                                         rep(1:20, rep(5, 20)), FUN=mean), 
                           type='mean_of_5')
samp_mean_20 <- data.frame(income=tapply(sample(ChickWeight$weight, 20*20), 
                                         rep(1:20, rep(20, 20)), FUN=mean), 
                           type='mean_of_20')
income <- rbind(samp_data, samp_mean_05, samp_mean_20)
income$type = factor(income$type, 
                     levels=c('data_dist','mean_of_5', 'mean_of_20'),
                     labels=c('Data','Mean of 5', 'Mean of 20'))
ggplot(income, aes(x=income)) + geom_histogram(bins=30)+facet_grid(type ~ .)
