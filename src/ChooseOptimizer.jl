module ChooseOptimizer

using Cbc, JuMP

export set_optimizer, get_optimizer

SOLVER = Cbc

function set_optimizer(OPT_NAME::Module=Cbc)
    global SOLVER = OPT_NAME
end

function get_optimizer()
    global SOLVER
    return JuMP.with_optimizer(SOLVER.Optimizer)
end


# function set_optimizer_options(opts)
# function get_optimizer_options()



end
