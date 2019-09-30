using Documenter, FresnelIntegrals

makedocs(;
    modules=[FresnelIntegrals],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/kiranshila/FresnelIntegrals.jl/blob/{commit}{path}#L{line}",
    sitename="FresnelIntegrals.jl",
    authors="Kiran Shila
 <me@kiranshila.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/kiranshila/FresnelIntegrals.jl",
)
