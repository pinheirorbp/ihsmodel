# Resource species names
resnames=colnames(match00)
#Producing the vector of availabilities
if (k_method== "all100"){
  k= rep(100,times=Sres) 
}
if (k_method=="rnorm200-50"){
k= rnorm(Sres,200,50)
}
names(k)=resnames
# Removing variables
rm(resnames)
