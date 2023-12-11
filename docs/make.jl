using Documenter, FresnelIntegrals

makedocs(sitename="FresnelIntegrals.jl")

DocMeta.setdocmeta!(FresnelIntegrals, :DocTestSetup, :(using FresnelIntegrals); recursive=true)

makedocs(;
    modules=[FresnelIntegrals],
    authors="Kiran Shila <me@kiranshila.com> and contributors",
    repo="https://github.com/kiranshila/FresnelIntegrals.jl/blob/{commit}{path}#{line}",
    sitename="FresnelIntegrals.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://kiranshila.github.io/FresnelIntegrals.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/kiranshila/FresnelIntegrals.jl",
    devbranch="main",
)