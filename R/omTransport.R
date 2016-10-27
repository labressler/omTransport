list.of.packages <- c("lpSolve")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
options(stringsAsFactors=F)

omTransport <- function(tamatrix,taskweights=NULL,agentassignment=NULL,tasknames=NULL,agentnames=NULL,type=c("assignment","matrix")) #tasks are the rows, agents are the columns
{
  zc <- tamatrix
  if(is.null(tasknames))
  {
    tasknames <- 1:nrow(tamatrix)
  }
  if(is.null(agentnames))
  {
    agentnames <- 1:ncol(tamatrix)
  }
  rownames(zc) <- tasknames
  colnames(zc) <- agentnames
  agentassg <- agentassignment
  if(is.null(agentassignment))
  {
    if(is.null(taskweights))
    {
      agentassg <- rep(1,ncol(zc))
    } else {
      taskweightmean <- mean(taskweights)
      adjtmean <- round(taskweightmean*nrow(zc)/ncol(zc))
      agentassg <- rep(adjtmean,ncol(zc))
      diffa <- sum(taskweights)-sum(agentassg)
      icount <- 1
      while(diffa!=0)
      {
        agentassg[icount] <- agentassg[icount]+sign(diffa)
        icount <- icount+1
        diffa <- diffa-sign(diffa)
      }
    }
  }
  if(is.null(taskweights))
  {
    if(mean(agentassg)==1)
    {
      taskweights <- rep(agentassg,nrow(zc))
    } else {
      agentassgmean <- mean(agentassg)
      adjamean <- round(agentassgmeanmean*ncol(zc)/nrow(zc))
      taskweights <- rep(adjamean,nrow(zc))
    }
  }
  onetomanyTransport <- function(par)
  {
    col.rhs <- round(par)
    col.signs <- ifelse(col.rhs==mean(agentassg),"==",ifelse(col.rhs>mean(agentassg),"<=",">="))
    row.signs <- rep ("==", nrow(zc))
    row.rhs <- taskweights
    lpt <- lp.transport (as.matrix(zc), "min", row.signs, row.rhs, col.signs, col.rhs)
    lpp <- lpt$solution
    rownames(lpp) <- rownames(zc)
    colnames(lpp) <- colnames(zc)
    whichwrong <- which(rowSums(lpp==0)==(ncol(zc)-2))
    lppw <- lpp[whichwrong,]
    lcol <- which(lpp<(.5*rowSums(lpp)) & lpp != 0,arr.ind=T)
    hcol <- which(lpp>(.5*rowSums(lpp)) & lpp != 0,arr.ind=T)
    colnames(lcol)[2] <- "ridcol"
    colnames(hcol)[2] <- "keepcol"
    cols <- merge(lcol,hcol,by="row")
    lpp2 <- lpp
    if(nrow(cols)>0)
    {
      for (i in 1:nrow(cols))
      {
        vec1 <- as.vector(t(cols[i,c(1,2)]))
        vec2 <- as.vector(t(cols[i,c(1,3)]))
        lpp2[vec2[1],vec2[2]] <- lpp2[vec2[1],vec2[2]] + lpp2[vec1[1],vec1[2]]
        lpp2[vec1[1],vec1[2]] <- 0
      }
    }
    whichwrong3 <- which(rowSums(lpp2==0)!=(ncol(zc)-1))
    if(length(whichwrong3)>0)
    {
      for (nr in whichwrong3)
      {
        ourrow <- lpp2[nr,]
        nrs <- rowSums(lpp2)[nr]
        nrrs <- rowSums(lpp2)
        nrsmax <- max(t(lpp2[nr,]))
        whichnot0 <- as.vector(which(lpp2[nr,]!=0))
        brow <- which.min(nrrs[whichnot0])
        for (ij in 1:ncol(lpp2))
        {
          if(lpp2[nr,ij]==nrsmax)
          {
            lpp2[nr,ij] <- nrs
            nrsmax <- nrsmax+1000
          } else {
            lpp2[nr,ij] <- 0
          }
        }
      }
    }
    return(sd(colSums(lpp2)))
  }
  lownum <- 10000000
  yy <- optim(agentassg,onetomanyTransport,control=list(maxit=200))
  pary <- round(yy$par)
  transportsol <- function(par)
  {
    col.rhs <- round(par)
    col.signs <- ifelse(col.rhs==mean(agentassg),"==",ifelse(col.rhs>mean(agentassg),"<=",">="))
    row.signs <- rep ("==", nrow(zc))
    row.rhs <- taskweights
    lpt <- lp.transport (as.matrix(zc), "min", row.signs, row.rhs, col.signs, col.rhs)
    lpp <- lpt$solution
    rownames(lpp) <- rownames(zc)
    colnames(lpp) <- colnames(zc)
    whichwrong <- which(rowSums(lpp==0)==(ncol(zc)-2))
    lppw <- lpp[whichwrong,]
    lcol <- which(lpp<(.5*rowSums(lpp)) & lpp != 0,arr.ind=T)
    hcol <- which(lpp>(.5*rowSums(lpp)) & lpp != 0,arr.ind=T)
    colnames(lcol)[2] <- "ridcol"
    colnames(hcol)[2] <- "keepcol"
    cols <- merge(lcol,hcol,by="row")
    lpp2 <- lpp
    if(nrow(cols)>0)
    {
      for (i in 1:nrow(cols))
      {
        vec1 <- as.vector(t(cols[i,c(1,2)]))
        vec2 <- as.vector(t(cols[i,c(1,3)]))
        lpp2[vec2[1],vec2[2]] <- lpp2[vec2[1],vec2[2]] + lpp2[vec1[1],vec1[2]]
        lpp2[vec1[1],vec1[2]] <- 0
      }
    }
    whichwrong3 <- which(rowSums(lpp2==0)!=(ncol(zc)-1))
    if(length(whichwrong3)>0)
    {
      for (nr in whichwrong3)
      {
        ourrow <- lpp2[nr,]
        nrs <- rowSums(lpp2)[nr]
        nrrs <- rowSums(lpp2)
        nrsmax <- max(t(lpp2[nr,]))
        whichnot0 <- as.vector(which(lpp2[nr,]!=0))
        brow <- which.min(nrrs[whichnot0])
        for (ij in 1:ncol(lpp2))
        {
          if(lpp2[nr,ij]==nrsmax)
          {
            lpp2[nr,ij] <- nrs
            nrsmax <- nrsmax+1000
          } else {
            lpp2[nr,ij] <- 0
          }
        }
      }
    }
    return(lpp2)
  }
  fin <- transportsol(pary)
  assg <- sapply(1:ncol(zc),function (x) rownames(fin)[which(fin[,x]!=0)])
  names(assg) <- colnames(zc)
  assg1 <- paste(assg,sep=",")
  asg1 <- paste(names(assg),assg1,sep=",")
  typ <- match.arg(type)
  if (typ=="assignment")
  {
    return (assg)
  } else {
    return(fin)
  }
  return(assg)
}
