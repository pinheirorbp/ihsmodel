#Initial match matrix
resnames=character()
for(i in 1:Sres){
      resnames[i]= paste("resource",i,sep = "_")
}
connames=character()
for(i in 1:Scon){
      connames[i]= paste("consumer",i,sep = "_")
}
if (initial_matrix=="all0"){
  match00= matrix (rep(0,times=Sres*Scon),Scon,Sres,dimnames=list(connames,resnames))
}
if (initial_matrix=="all1"){
  match00= matrix (rep(1,times=Sres*Scon),Scon,Sres,dimnames=list(connames,resnames))
}
if (initial_matrix=="rnorm"){
  match00= matrix (rnorm(Scon*Sres,1,1),Scon,Sres,dimnames=list(connames,resnames))
}

  # Removing variables
rm(resnames,connames,i)
