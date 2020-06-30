using Test, ChooseOptimizer, Cbc

@test get_solver_name() == Cbc
