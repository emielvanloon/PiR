set.seed <- 20

nr_yr <- 5
nr_mnt <- 2
nr_rep <- 5

ime    <- c("morning", "morning", "evening", "evening")   
imnt   <- c(12, 1, 12, 1)
tmean <- c( 3.5, 2.5, 4.6, 3.1)
tsd   <- c( 3.0, 2.7, 4.0, 3.8)

yr <- rep(2020:2024, each=nr_mnt*nr_rep)
mnt <- rep(c(1,12), each=nr_rep, times=nr_yr)
sample_day <- function(nr_rep) {sample(1:31, size=nr_rep, replace=FALSE)}
day <- as.vector( sapply(rep(5, nr_yr*nr_mnt), FUN=sample_day) )
tod  <- c( sample(c("morning","evening"), size=nr_yr*nr_mnt*nr_rep, replace=TRUE) )

temp <- rep(NA, length=nr_yr*nr_mnt*nr_rep)
prec <- rep(TRUE, length=nr_yr*nr_mnt*nr_rep)

for(i in seq_along(ime)){
  idx <- tod==ime[i] & mnt==imnt[i]
  temp[idx] <- rnorm(n=sum(idx), mean=tmean[i], sd=tsd[i]) 
}

idx <- temp<3
prec[idx] <-  sample(c(FALSE,TRUE), size=sum(idx), replace=TRUE, prob=c(0.9,0.1))
prec[!idx] <- sample(c(FALSE,TRUE), size=sum(!idx), replace=TRUE, prob=c(0.8,0.2))

tpdata <- data.frame( year=yr, month=mnt, day=day, time=tod, temp=temp, prec=prec)

