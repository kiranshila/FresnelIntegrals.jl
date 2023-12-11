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

    # Generate random real number
    z = randn(Float64)
    # Test by comparing to numeric solution
    @test fresnelc(z) ≈ quadgk(t->cos(π*t^2/2),0,z)[1]
    @test fresnels(z) ≈ quadgk(t->sin(π*t^2/2),0,z)[1]
    # Test just for code coverage 😄
    @test (fresnelc(z),fresnels(z)) == fresnel(z)

    # Precise values come from WolframAlpha calculator
    # One could add more decimals and more tests if needed

    @test fresnels(1.)      ≈ 0.4382591473903
    @test fresnelc(1.)      ≈ 0.7798934003768
    @test fresnels(sqrt(2)*im) ≈ -0.7139722140219*im
    @test fresnelc(sqrt(2)*im) ≈ 0.5288915951112*im
end
