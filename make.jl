using Revise, JSServe, Markdown
import JSServe.TailwindDashboard as D

includet("src/html-classes.jl")
includet("src/index.jl")
includet("src/github.jl")
includet("src/support.jl")
includet("src/team.jl")
includet("src/contact.jl")

routes, task, server = interactive_server([asset_path(), joinpath(@__DIR__, "src")]) do
    return Routes(
        "/" => index,
        "/team" => team,
        "/contact" => contact,
        "/support" => support
    )
end

##

dir = joinpath(@__DIR__, "docs")
# only delete the jsserve generated files
rm(joinpath(dir, "jsserve"); recursive=true, force=true)
JSServe.export_static(dir, routes)
