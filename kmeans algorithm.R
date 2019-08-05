cat('Reading the data set')
data= read.csv(file.choose(), header = F)
str(data)
# naming the columns of the data set
names(data)= c('Longitude','Latitude')
# checking the data set
head(data)

cat('Normalizatiom\n')
# determing the mean 
m_ean = apply(data,2,mean)
# determining the standard deviation
s_td = apply(data, 2, sd)
z = scale(data,m_ean,s_td)
distance = dist(z)

 # k means algorithm
k.algo =hclust(distance)
results = cutree(k.algo,3)
results

# writing to clusters.txt
write.csv(results, 'clusters.txt')

