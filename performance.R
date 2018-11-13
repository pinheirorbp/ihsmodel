perf_calc=function (match_matrix,k){
  match_matrix[match_matrix<0]=0
  compvec=colSums(match_matrix)
  performance_matrix= matrix(NA,nrow = nrow(match_matrix),ncol = ncol(match_matrix))
  for (i in (1:nrow(match_matrix))){
    for (j in (1:ncol(match_matrix))){
      performance_matrix[i,j]=(match_matrix[i,j]/compvec[j])*k[j]
      performance_matrix[performance_matrix=="NaN"]=0
    }
  }
  dimnames(performance_matrix)<-dimnames(match_matrix)
  return(performance_matrix)
}