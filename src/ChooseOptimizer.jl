module ChooseOptimizer

using HiGHS
using JuMP

export clear_solver_options,
    get_solver,
    get_solver_name,
    get_solver_options,
    set_solver,
    set_solver_options,
    set_solver_verbose

_SOLVER = HiGHS
_SOLVER_OPTS = Dict{String,Any}()
function __init__()
    set_solver_verbose(false)
end

"""
    set_solver(OPT_NAME::Module = HiGHS, verb::Bool = false)

Sets the optimization solver to be used.

This automatically invokes `clear_solver_options()` and 
then sets the appropriate option for verbose output based
on the value of the (optional) `verb` argument.
"""
function set_solver(OPT_NAME::Module=HiGHS, verb::Bool=false)
    clear_solver_options()
    global _SOLVER = OPT_NAME
    set_solver_verbose(verb)
    nothing
end

"""
    set_solver_options(kwd::String, val)
    set_solver_options(d::Dict)

`set_solver_options(kwd::Symbol, val)` sets an option to be used
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
    clear_solver_options()

Clear all solver options.
"""
function clear_solver_options()
    global _SOLVER_OPTS = Dict{String,Any}()
    nothing
end

"""
    get_solver_options()::Dict

Return the dictionary of current solver options.
"""
function get_solver_options()::Dict
    global _SOLVER_OPTS
    return _SOLVER_OPTS
end

"""
    get_solver()

Generates the necessary arguments for creating a `JuMP`
`Model`. That is, one simply uses `Model(get_solver())`.
"""
function get_solver()
    global _SOLVER
    global _SOLVER_OPTS

    d = get_solver_options()
    return JuMP.optimizer_with_attributes(_SOLVER.Optimizer, d...)
end

"""
    get_solver_name()

Returns the solver module that is currently chosen.
"""
function get_solver_name()
    global _SOLVER
    return _SOLVER
end

include("set_verbose.jl")

end
