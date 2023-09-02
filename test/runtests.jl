using Test, SimpleGraphs, Permutations, CayleyGraphs

# Path Graph
p = Permutation([5,1,2,3,4])
G = CayleyGraph(p)
@test NV(G) == 5
@test NE(G) == 5

q = Permutation([2,1,3,4,5])
G = CayleyGraph(p,q)
@test all(3 .== deg(G))

@test CayleyGraph(inv(p),q) == G