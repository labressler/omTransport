# omTransport (one-to-many transportation problem)

This respository contains the R code to an approximate solution to the **one-to-many transportation (OTM) problem**, which assigns a number of agents to a number of tasks, each of which has a weight. Each task can only be assigned to only one agent. The tasks must be assigned in a way that minimizes an overall cost function, while keeping the distribution of weights for the agents within certain bounds.

This problem differs from well-known combinatorial optimization problems in the following ways:

**[Multiple Assignment Problem:](https://en.wikipedia.org/wiki/Assignment_problem)** While the multiple assignment problem gives each task a weight of only one, OTM can give tasks any non-negative weights. Therefore, the multiple assignment problem is a special case of OTM.

**[Transportation problem:](https://en.wikipedia.org/wiki/Transportation_theory_(mathematics))** The constraints in the transportation problem allow for one task to be assigned to more than one agent, making it a more generalized version of omTransport.

**[College assignment problem:](https://en.wikipedia.org/wiki/Stable_marriage_problem#Similar_problems)** This problem only utilizes the "ranks" of the preferences of the agents, and assigns each tasks with a weight of only one.


**To download**: In your R console, type:

```R
install.packages("devtools")
require(devtools)
install_github("labressler/omTransport")
```

**Example uses:** Visit (http://labressler.github.io/analytics/omtransportvignette.html).



