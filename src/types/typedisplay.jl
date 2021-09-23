"""
Food Webs 
"""

function Base.show(io::IO, DFW::FoodWeb)
    N = UnipartiteNetwork(DFW.A, DFW.species)
    mthd = DFW.method
    print(io, "$(richness(N; dims=1)) species - $(links(N)) links. \n Method: $mthd")
end

"""
Functional Response
"""

function Base.show(io::IO, f::FunctionalResponse)
    
    str1 = "functional response: $(String(Symbol(f.functional_response)))"
    if f.hill_exponent == 1.0
        str2 = "type II"
    elseif f.hill_exponent == 2.0 
        str2 = "type III"
    else
        str2 = "h = $(f.hill_exponent)"
    end
    print(io, str1 * "\n" * str2)

end

""" 
Biological Rates
"""

function Base.show(io::IO, b::BioRates)
    
    str1 = "r (growth rate): $(b.r[1]), ..., $(b.r[end])"
    str2 = "x (metabolic rate): $(b.x[1]), ..., $(b.x[end])"
    str3 = "y (max. consumption rate): $(b.y[1]), ..., $(b.y[end])"
    print(io, str1 * "\n" * str2 * "\n" * str3)

end
