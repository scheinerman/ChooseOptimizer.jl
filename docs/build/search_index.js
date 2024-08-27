var documenterSearchIndex = {"docs":
[{"location":"#ChooseOptimizer","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"","category":"section"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"This module is a tool to select different optimization engines when using JuMP and to change solver options.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"New in version 0.3: Default solver is HiGHS and set_solver defaults to non-verbose output. ","category":"page"},{"location":"#Selecting-and-using-a-solver","page":"ChooseOptimizer","title":"Selecting and using a solver","text":"","category":"section"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The set_solver function is used to select the optimization package desired. Without any arguments it selects the HiGHS optimizer. Otherwise, set_solver(NAME) is used to choose the desired optimizer, e.g., set_solver(Gurobi). (For this to work, this must follow using Gurboi.)","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The function get_solver is a replacement for JuMP's with_solver function. ","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"Instead of this:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"MOD = Model(with_solver(HiGHS.Optimizer))","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"we do this:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"set_solver(HiGHS)\nMOD = Model(get_solver())","category":"page"},{"location":"#Solvers","page":"ChooseOptimizer","title":"Solvers","text":"","category":"section"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The default solver is HiGHS.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The supported solvers are:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"Cbc\nCPLEX\nGLPK\nGurobi\nHiGHS","category":"page"},{"location":"#Selecting-and-using-solver-options","page":"ChooseOptimizer","title":"Selecting and using solver options","text":"","category":"section"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"Solver options can be set up using these functions:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"set_solver_options(kwd, val) adds the option whose name is","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"given by the symbol kwd to be the value val. To add several options, use this several times.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"set_solver_options(d::Dict) adds all the key/value entries","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"in d as options by repeated calls to set_solver_options(key,value).","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"clear_solver_options() erases all solver options.\nget_solver_options() returns a dictionary of the options that","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"are currently set.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"When a JuMP model is created using Model(get_solver()) the options are passed along.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"Note that each call to set_solver clears all options and then resets  the output (verbose) level. ","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The function set_solver takes an optional second Boolean argument to set the output level:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"set_solver(OPT_NAME::Module = HiGHS, verbose::Bool = false)","category":"page"},{"location":"#Verbose-output","page":"ChooseOptimizer","title":"Verbose output","text":"","category":"section"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The set_solver_verbose() function can be used to tell the solver to be verbose in its operation. Alternatively, set_solver_verbose(false) suppresses output.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"The action of set_solver_verbose is through set_solver_options.","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"At present, this function only knows how to do this for the Cbc, CPLEX, GLPK, Gurobi, and HiGHS optimizers. It is easy, however, to add additional solvers by modifying the file set_verbose.jl or in the REPL with a command that looks like this:","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"ChooseOptimizer._solver_table[\"NAME\"] = (\"opt_name\", yes_val, no_val)","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"where ","category":"page"},{"location":"","page":"ChooseOptimizer","title":"ChooseOptimizer","text":"NAME is the name of the solver, \nopt_name is the option name that controls output for that solver, \nyes_val is the value for verbose output, and\nno_val is the value for supressing output.","category":"page"}]
}