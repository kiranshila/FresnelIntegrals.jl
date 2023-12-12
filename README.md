# FresnelIntegrals.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://kiranshila.github.io/FresnelIntegrals.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://kiranshila.github.io/FresnelIntegrals.jl/dev/)
[![Build Status](https://github.com/kiranshila/FresnelIntegrals.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/kiranshila/FresnelIntegrals.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/kiranshila/FresnelIntegrals.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/kiranshila/FresnelIntegrals.jl)

A quick Julia library for calculating Fresnel Integrals using the error function from [SpecialFunctions.jl](https://github.com/JuliaMath/SpecialFunctions.jl).

```julia
using FresnelIntegrals
using Plots

z = -30:0.001:30
plot(fresnelc, fresnels, z; legend=false, title="Euler Spiral", xlabel="C(z)", ylabel="S(z)")
```
![Spiral](Spiral.png)

As expected, this is much faster than the numeric integral solution

```julia
using QuadGK
using FresnelIntegrals
using BenchmarkTools

julia> @benchmark fresnelc(1.8)
BenchmarkTools.Trial: 10000 samples with 961 evaluations.
 Range (min … max):  86.629 ns … 192.074 ns  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     89.056 ns               ┊ GC (median):    0.00%
 Time  (mean ± σ):   90.710 ns ±   5.423 ns  ┊ GC (mean ± σ):  0.00% ± 0.00%

  ▆▆█▅ ▇█▃ ▁▂▄▃ ▂▃▂▁▂▁▂▂▂▂▂▁▁▁  ▁     ▁                        ▂
  ████▇███▇███████████████████████████████▇▇█▇▇▇▆▆▆▇▆▇▆▆▆▇▆▆▆▅ █
  86.6 ns       Histogram: log(frequency) by time       111 ns <

 Memory estimate: 0 bytes, allocs estimate: 0.

julia> @benchmark quadgk(t->cospi(t^2/2),0,1.8)
BenchmarkTools.Trial: 10000 samples with 201 evaluations.
 Range (min … max):  394.697 ns …  2.443 μs  ┊ GC (min … max): 0.00% … 79.19%
 Time  (median):     411.279 ns              ┊ GC (median):    0.00%
 Time  (mean ± σ):   424.133 ns ± 75.245 ns  ┊ GC (mean ± σ):  0.65% ±  3.09%

    ▄▄▂▂▄▇██▆▃▁▁▂▂▃▃▄▄▄▄▃▄▃▂▂▁▁▁▁▂▂▂▂▂▁▂▁                      ▂
  ▂███████████████████████████████████████████▇▇█▇█▇▇▇▇▅▅▄▅▆▅▅ █
  395 ns        Histogram: log(frequency) by time       499 ns <

 Memory estimate: 368 bytes, allocs estimate: 2.
```
