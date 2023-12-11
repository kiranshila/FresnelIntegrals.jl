using Documenter, FresnelIntegrals
using Documenter.Remotes

makedocs(sitename="FresnelIntegrals.jl")

DocMeta.setdocmeta!(FresnelIntegrals, :DocTestSetup, :(using FresnelIntegrals); recursive=true)

makedocs(;
    modules=[FresnelIntegrals],
    authors="Kiran Shila <me@kiranshila.com> and contributors",
    repo=Remotes.GitHub("kiranshila","FresnelIntegrals.jl"),
    sitename="FresnelIntegrals.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://kiranshila.github.io/FresnelIntegrals.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/kiranshila/FresnelIntegrals.jl.git",
    devbranch="master",
)