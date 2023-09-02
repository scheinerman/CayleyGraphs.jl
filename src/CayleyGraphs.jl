module CayleyGraphs

using Permutations, SimpleGraphs
export CayleyGraph

"""
    CayleyGraph(plist::Vector{Permutation})::UG{Permutation}
    CayleyGraph(p1,p2,...)

Create a Cayley graph using the permutations (generators) in `plist`.
"""
function CayleyGraph(plist::Vector{Permutation})::UG{Permutation}
    if length(plist) == 0
        error("No permutations provided")
    end

    n = length(plist[1])
    # check that all permutations have the same length
    for p in plist
        if length(p) != n
            error("All permutations must be the same length")
        end
    end

    G = UG{Permutation}()
    name(G, "Cayley Graph")


    todo = Set{Permutation}()
    finished = Set{Permutation}()

    push!(todo, Permutation(n))

    while !isempty(todo)
        v = first(todo)
        pop!(todo, v)
        push!(finished, v)

        for p in plist
            w = v * p
            add!(G, v, w)
            if w ∉ finished
                push!(todo, w)
            end
        end
    end
    return G
end

CayleyGraph(ps...) = CayleyGraph(collect(ps))



end # module CayleyGraphs
