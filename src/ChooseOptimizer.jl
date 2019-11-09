module ChooseOptimizer

using Cbc

export set_optimizer, get_optimizer

SOLVER = Cbc

function set_optimizer(OPT:_NAME:Module=Cbc)
    global SOLVER = OPT_NAME
end

# function set_optimizer_options(opts)
# function get_optimizer_options()

function get_optimizer()
    global SOLVER
    return SOLVER.Optimizer()
end


end
