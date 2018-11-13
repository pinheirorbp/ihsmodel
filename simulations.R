# Creating RData for storing results
results= list()
save(results,file = "results.RData")
# Loading parameters from table
tablesims= read.table("parsimulations.txt",header=T,sep="\t")
using_simulR="viver e muito perigoso, porque ainda nao se sabe e porque aprender a viver e que e o viver mesmo (Guimaraes Rosa)"
for (nsim in 1:nrow(tablesims)){
  nsim0=as.character(tablesims[nsim,1])
  Sres0= tablesims[nsim,2]
  Scon0= tablesims[nsim,3]
  nclust0= tablesims[nsim,4]
  supdim0=tablesims[nsim,5]
  maxdis0= tablesims[nsim,6]
  clustprob0= as.numeric(strsplit(as.character(tablesims[nsim,7]),"-")[[1]])
  initial_matrix0=as.character(tablesims[nsim,8])
  k_method0=as.character(tablesims[nsim,9])
  iterations0=tablesims[nsim,10]
  
  # Runing IHS model
  print(nsim0)
  source("IHS_model.R")
  
  # Results and information storage
  load("results.RData")
  le=length(results)
  results[[le+1]]= list(ID=nsim0,parameters=list(Sres=Sres, Scon=Scon, nclust=nclust, supdim=supdim, maxdis=maxdis, clustprob=clustprob, initial_matrix=initial_matrix, k_method=k_method, iterations=iterations),dissimilarity_matrix=dissimilarity_matrix,match_matrix=match_matrix,log=Log,performance_matrix=performance_matrix, match00=match00, k=k)
  names(results)=c(names(results[1:le]),nsim0)
  save(results, file="results.RData")
  # Removing variables
  rm(clustprob0,clustprob,perf_calc,dissimilarity_matrix,maxdis0,supdim,supdim0,
     match_matrix,match00,iterations,iterations0,k,k_method,k_method0,Log,
     initial_matrix,initial_matrix0,nclust0,nclust,Sres0,Sres,Scon0,Scon,nsim0,performance_matrix,results,le, maxdis)
}
rm(nsim,tablesims, using_simulR)
load("results.RData")
