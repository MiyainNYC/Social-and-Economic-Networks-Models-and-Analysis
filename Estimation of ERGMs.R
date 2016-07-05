library(statnet)

#Let's load the florentine marriage data:

data(florentine)

#To find out about the data, type
summary(flomarriage)

#Fitting ERGMs. Now, let us fit some simple ERGMs to these data. First,
#let us fit the Erdos-Renyi random graph, where only the number of links
#(edges) matter in determining the probability of the network. Type

model1 <- ergm(flomarriage~ edges)

#To see the output type
summary(model1)

#Find the option that matches the coefficient you got for edges.
#Recall from lecture that this coefficient should be ln(p/(1-p)), so
#what is p? (the probability of a link)
#Let us try a slightly richer ERGM, including the number of triangles
#(triads):

model2 <- ergm(flomarriage ~ edges + triangles)
summary(model2)

#Once you start running more elaborate ERGMs, even this simple with
#small numbers of nodes, by chance, you might have some problems with
#convergence. Just as a check, run it again and see what how different the
#estimates are.
#Find the option that matches the coefficient you got for triangles.
#You can try some other variations, for instance including a count of 2-
#stars:

model3 <- ergm(flomarriage ~ edges + triangles + kstar(2))
summary(model3)

