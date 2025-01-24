set.seed(10)

totspec <- LETTERS[1:25] 
sph <- c(9,12,4,7,14)

bddata <- data.frame(
             habitat = c(rep("broadleaved",sph[1]),
                rep("mixed",sph[2]),
                rep("heathland",sph[3]),
                rep("meadow",sph[4]),
                rep("urban",sph[5])),
             species = c(sample(totspec[1:12],size=sph[1]),
                sample(totspec[4:17],size=sph[2]),
                sample(totspec[c(2:5,15:19)], size=sph[3]),
                sample(totspec[c(1:3,14:17,20:21)], size=sph[4]),
                sample(totspec[c(1:6,15:20,22:25)], size=sph[5]))
             )
