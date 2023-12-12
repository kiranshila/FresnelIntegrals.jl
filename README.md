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

julia> @benchmark fresnelc(1.8)
BenchmarkTools.Trial: 10000 samples with 772 evaluations.
 Range (min … max):  161.448 ns …  1.744 μs  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     163.927 ns              ┊ GC (median):    0.00%
 Time  (mean ± σ):   164.460 ns ± 16.519 ns  ┊ GC (mean ± σ):  0.00% ± 0.00%

  ▃▄▂                ▁▇█▄          ▁  ▃▄▂▁        ▁▁▁          ▂
  ███▇▁▃▁▁▁▁▁▁▁▁▁▁▅▇▅█████▁▄▄▄▆▆▅▆▆█▇▆█████▇▆▅▅▇██████▇▇▆▇▇▆▅▆ █
  161 ns        Histogram: log(frequency) by time       168 ns <

 Memory estimate: 0 bytes, allocs estimate: 0.

julia> @benchmark quadgk(t->cos(π*t^2/2),0,1.8)
BenchmarkTools.Trial: 10000 samples with 187 evaluations.
 Range (min … max):  548.321 ns …  48.949 μs  ┊ GC (min … max): 0.00% … 98.43%
 Time  (median):     554.893 ns               ┊ GC (median):    0.00%
 Time  (mean ± σ):   599.010 ns ± 558.147 ns  ┊ GC (mean ± σ):  2.25% ±  3.29%

  ▅█▆▂▄▃▃▁▁▁▁▁                    ▂▁                  ▁▁▁▁▂▁    ▁
  ███████████████▇▅▆▅▄▃▅▄▅▅▅▄▄▃▄████████▇▇▆▆▇▆▆▆▇▇▇▇▇█████████▇ █
  548 ns        Histogram: log(frequency) by time        754 ns <

 Memory estimate: 368 bytes, allocs estimate: 2.
```
