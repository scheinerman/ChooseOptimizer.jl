using Test, ChooseOptimizer, GLPK

@test get_solver_name() == GLPK
set_solver_verbose(false)
d = get_solver_options()
@test d["msg_lev"] == 0
