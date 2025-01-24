mk_bddata <- function( totspec = LETTERS[1:25],
                       sph = c(9,12,4,7,14),
                       lbl = c("broadleaved","mixed","heath","meadow","urban"),
                       sppool = list(1:12, 4:17, c(2:5,15:19), c(1:3,14:17,20:21), c(1:6,15:20,22:25)),
                       rndseed = 10){
  set.seed(rndseed)
  habitat <- vector()
  for(i in seq_along(sph)){
    habitat <- c(habitat, rep(lbl[i],sph[i]))    
  }
  
  species <- vector()
  for(i in seq_along(sph)){
    species <- c(species, sample(totspec[sppool[[i]]],size=sph[i]))    
  }
  
  bddata <- data.frame(habitat = habitat, species = species)
  return(bddata)
}

bddata <- mk_bddata()
rm(mk_bddata)