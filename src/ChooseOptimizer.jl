module ChooseOptimizer

using Cbc, JuMP

export set_solver, get_solver, get_solver_name
export set_solver_options, clear_solver_options, get_solver_options
export set_solver_verbose

_SOLVER = Cbc
_SOLVER_OPTS = Dict{String,Any}()


"""
`set_solver(OPT_NAME::Module=Cbc)` sets the optimization solver to be used.
Note: This automatically invokes `clear_solver_options()`.
"""
function set_solver(OPT_NAME::Module = Cbc)
    clear_solver_options()
    global _SOLVER = OPT_NAME
    # @info "Solver set to $_SOLVER"
    nothing
end

"""
`set_solver_options(kwd::Symbol, val)` set an option to be used
by the solver.

`set_solver_options(d::Dict)` adds all the options in `d`.
"""
function set_solver_options(kwd::String, val)
    global _SOLVER_OPTS[kwd] = val
end

function set_solver_options(d::Dict)
    for k in keys(d)
        set_solver_options(k, d[k])
    end
    nothing
end

"""
`clear_solver_options()` clears all solver options.
"""
function clear_solver_options()
    global _SOLVER_OPTS = Dict{String,Any}()
    nothing
end

"""
`get_solver_options()` returns the dictionary of current solver options.
"""
function get_solver_options()::Dict
    global _SOLVER_OPTS
    return _SOLVER_OPTS
end

"""
`get_solver()` generates the necessary arguments for creating a `JuMP`
`Model`. That is, one just uses `Model(get_solver())`.
"""
function get_solver()
    global _SOLVER
    global _SOLVER_OPTS

    d = get_solver_options()
    return JuMP.optimizer_with_attributes(_SOLVER.Optimizer, d...)

    # return JuMP.with_optimizer(_SOLVER.Optimizer; get_solver_options()...)
end

function get_solver_name()
    global _SOLVER
    return _SOLVER
end


include("set_verbose.jl")


end
