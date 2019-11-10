module ChooseOptimizer

using Cbc, JuMP

export set_solver, get_solver
export set_solver_options, clear_solver_options, get_solver_options
export set_solver_verbose

SOLVER = Cbc
SOLVER_OPTS = Dict()

"""
`set_solver(OPT_NAME::Module=Cbc)` sets the optimization solver to be used.
Note: This automatically invokes `clear_solver_options()`.
"""
function set_solver(OPT_NAME::Module=Cbc)
    clear_solver_options()
    global SOLVER = OPT_NAME
end

"""
`set_solver_options(kwd::Symbol, val)` set an option to be used
by the solver.

`set_solver_options(d::Dict)` adds all the options in `d`.
"""
function set_solver_options(kwd::Symbol, val)
    global SOLVER_OPTS[kwd] = val
end

function set_solver_options(d::Dict)
    for k in keys(d)
        set_solver_options(k,d[k])
    end
    nothing
end

"""
`clear_solver_options()` clears all solver options.
"""
function clear_solver_options()
    global SOLVER_OPTS = Dict()
    nothing
end

"""
`get_solver_options()` returns the dictionary of current solver options.
"""
function get_solver_options()::Dict
    global SOLVER_OPTS
    return SOLVER_OPTS
end

"""
`get_solver()` generates the necessary arguments for creating a `JuMP`
`Model`. That is, one just uses `Model(get_solver())`.
"""
function get_solver()
    global SOLVER
    global SOLVER_OPTS
    return JuMP.with_optimizer(SOLVER.Optimizer; get_solver_options()...)
end

"""
`set_solver_verbose(verb = true)` sets how verbose the solver is
during its work.
"""
function set_solver_verbose(verb::Bool = true)
    global SOLVER
    val = verb ? 1 : 0
    key = :Unknown
    try
        if SOLVER == Cbc
            key = :LogLevel
        end
    catch
    end
    try
        if SOLVER == Main.Cbc
            key = :LogLevel
        end
    catch
    end
    try
        if SOLVER == Main.Gurobi
            key = :OutputFlag
        end
    catch
    end

    if key == :Unknown
        warn("Unable to set verbose option for $SOLVER")
    else
        set_solver_options(key,val)
    end
    nothing
end




end
