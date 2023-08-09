"""
The `_solver_table` maps solver Modules as Symbols (e.g., `:Cbc`) to 
a tuple of `(name, verbose, quiet)` values.
"""
_solver_table = Dict{String,Tuple{String,Any,Any}}()

_solver_table["Cbc"] = ("LogLevel", 1, 0)
_solver_table["Gurobi"] = ("OutputFlag", 1, 0)
_solver_table["GLPK"] = ("msg_lev", 2, 0)
_solver_table["HiGHS"] = ("output_flag", true, false)
_solver_table["CPLEX"] = ("CPXPARAM_ScreenOutput", 1, 0)


"""
`set_solver_verbose(verb = true)` sets how verbose the solver is
during its work.
"""
function set_solver_verbose(verb::Bool = true)

    the_solver = string(_SOLVER)

    if !haskey(_solver_table, the_solver)
        @warn("Unable to set verbose option for $the_solver")
        return
    end

    (opt, verbose, quiet) = _solver_table[the_solver]

    set_solver_options(opt, verb ? verbose : quiet)
    return verb
    # @info "Solver $_SOLVER verbose is set to $verb"
end

