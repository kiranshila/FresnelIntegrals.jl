module FresnelIntegrals
using SpecialFunctions
export fresnelc
export fresnels
export fresnel

"""
        fresnelc(z)
Calculates the Fresnel cosine integral for the number z
"""
fresnelc(z::Number) = 0.25*(1-1im)*(1im*erf(0.5*(1-1im)*z*√(π)) + erf(0.5*(1+1im)*z*√(π)))

"""
        fresnels(z)
Calculates the Fresnel sine integral for the number z
"""
fresnels(z::Number) = 0.25*(1+1im)*(-1im*erf(0.5*(1-1im)*z*√(π)) + erf(0.5*(1+1im)*z*√(π)))

"""
        fresnel(z)
Calculates the cosine and sine fresnel integrals
"""
fresnel(z::Number) = (fresnelc(z),fresnels(z))

end # module
