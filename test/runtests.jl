using Test, ChooseOptimizer, Cbc

@test get_solver_name() == Cbc
set_solver_verbose(false)
d = get_solver_options()
@test d["LogLevel"] == 0
