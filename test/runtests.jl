using Test, ChooseOptimizer, HiGHS

@test get_solver_name() == HiGHS
set_solver_verbose(false)
d = get_solver_options()
@test d["output_flag"] == 0
