module ChooseOptimizer

using Cbc, JuMP

export set_solver, get_solver
export set_solver_option, clear_solver_options, get_solver_options

SOLVER = Cbc
SOLVER_OPTS = Dict()

"""
`set_solver(OPT_NAME::Module=Cbc)` sets the optimization solver to be used.
"""
function set_solver(OPT_NAME::Module=Cbc)
    global SOLVER = OPT_NAME
end

"""
`set_solver_option(kwd::Symbol, val)` set an option to be used
by the solver.
"""
function set_solver_option(kwd::Symbol, val)
    global SOLVER_OPTS[kwd] = val
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
function get_solver_options()
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



end
