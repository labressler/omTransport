\name{omTransport}
\alias{omTransport}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ omTransport
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function contains an approximate solution to the one-to-many transportation (OTM) problem, which assigns a number of agents to a number of tasks, each of which has a weight. Each task can only be assigned to only one agent. The tasks must be assigned in a way that minimizes an overall cost function, while keeping the distribution of weights for the agents within certain bounds.
}
\usage{
omTransport(tamatrix,taskweights=NULL,agentassignment=NULL,tasknames=NULL,agentnames=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tamatrix,taskweights=NULL,agentassignment=NULL,tasknames=NULL,agentnames=NULL}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
