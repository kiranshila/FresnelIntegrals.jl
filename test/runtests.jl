using FresnelIntegrals
using Test
using QuadGK

@testset "FresnelIntegrals.jl" begin
    # Generate random complex number
    z = randn(ComplexF64)
    # Test by comparing to numeric solution
    @test fresnelc(z) ≈ quadgk(t->cos(π*t^2/2),0,z)[1]
    @test fresnels(z) ≈ quadgk(t->sin(π*t^2/2),0,z)[1]
    # Test just for code coverage 😄
    @test (fresnelc(z),fresnels(z)) == fresnel(z)
end
