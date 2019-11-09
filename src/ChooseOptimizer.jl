module ChooseOptimizer

using Cbc, JuMP

export set_solver, get_solver

SOLVER = Cbc

function set_solver(OPT_NAME::Module=Cbc)
    global SOLVER = OPT_NAME
end

function get_solver()
    global SOLVER
    return JuMP.with_optimizer(SOLVER.Optimizer)
end


# function set_solver_options(opts)
# function get_solver_options()

end
