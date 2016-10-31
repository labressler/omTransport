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
omTransport(tamatrix,taskweights=NULL,agentassignment=NULL,tasknames=NULL,agentnames=NULL,type=c("assignment","matrix"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tamatrix
}{The costs for each agent-task pairing, in matrix form, with the agents as the columns and the tasks as the rows.}
  \item{taskweights
}{How much effort each task takes. By default, all task weights are assumed to be the same.}
\item{agentassigment
}{The distribution of work to each agent. By default, all agents are assumed to take on an even distribution of work.}
\item{tasknames
}{Vector of the names of the tasks.}
\item{agentnames
}{Vector of the names of the agents.}
\item{type
}{Return type. "assignment" (default) returns a named list of each group of tasks, while "matrix" returns a (agents,tasks) dimension matrix similar to that used in lpSolve.}

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
df <- data.frame(Gardener=c(.1,.5,2,4,6,8,10,1,50,100),Farmer=c(.25,.75,1,2,3,4,5,1,25,125),Programmer=c(1,2,5,8,11,14,25,2.5,25,25)) #agent-task matrix
tasks <- c("Tree","Garden","Easy Field","Medium Field","Difficult Field","Really Difficult Field","Livestock","Cooking a Meal","Auditing a Business","Mobile Application")
agents <- c("Gardener","Farmer","Programmer")
efforts <- c(1,3,2,4,6,8,7,4,8,8)
omTransport(tamatrix=df,taskweights=efforts,tasknames=tasks,agentnames=agents)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ linearprogramming }% use one of  RShowDoc("KEYWORDS")
\keyword{ transportationproblem }% __ONLY ONE__ keyword per line
