# Resource species and clusters names
resnames=colnames(match00)
clustnames=character()
for(i in 1:nclust){
  clustnames[i]= paste("cluster",i,sep = "_")
}
rm(i)
# transforming clustprob in probabilities that sums 1
probsum= sum(clustprob)
clustprob=clustprob/probsum
# defining clusters
resclust=sample(clustnames,Sres,replace = T,prob=clustprob)
resclust=table(resclust)
nclust2=length(resclust)
rm(probsum,clustnames)
# dimensions 
ndim= 2*nclust2 # defining the number of dimensions
dnames=character()
for(i in 1:ndim){
  dnames[i]= paste("d",i,sep = "_")
}
resdim= matrix(NA,nrow=Sres,ncol=ndim)
range=100/nclust2
for (j in 1:ncol(resdim)){
  x=rep(sample(1:nclust2),times=as.vector(resclust))
  for (i in 1:nrow(resdim)){
    resdim[i,j]= runif(1,min=(x[i]-1)*range,max=x[i]*range*supdim)
  }
}
dimnames(resdim)=list(resnames,dnames)
# distance matrix of resource species
dissimilarity_matrix= dist(resdim, method = "euclidean")
dissimilarity_matrix=as.matrix(dissimilarity_matrix)
# Transforming values in matrix in 0>x>maxdis
dissimilarity_matrix= maxdis*dissimilarity_matrix/max(dissimilarity_matrix)
rm(resdim,dnames,resclust,resnames,i,j,
   range,nclust2,ndim,x)