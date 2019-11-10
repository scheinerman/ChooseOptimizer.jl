# ChooseOptimizer


This module is a tool to select different optimization engines.

Many of my modules rely on integer linear programming and use `JuMP`
and the like to solve the ILPs. This module makes switching between
different optimization engines easier.

## Selecting and using a solver

The `set_solver` function is used to select the optimization package
desired. Without any arguments it selects the `Cbc` optimizer. Otherwise,
`set_solver(NAME)` is used to choose the desired optimizer, e.g.,
`set_solver(Gurobi)`. (For this to work, this must follow
  `using Gurboi`.)

The function `get_solver` is a replacement for `JuMP`'s
`with_solver` function. Instead of this:
```
MOD = Model(with_solver(Cbc.Optimizer))
```
we do this:
```
MOD = Model(get_solver())
```

## Selecting and using solver options

Solver options can be set up using these functions:

* `set_solver_options(kwd, val)` adds the option whose name is
given by the symbol `kwd` to be the value `val`. To add several
options, use this several times.
* `set_solver_options(d::Dict)` adds all the key/value entries
in `d` as options by repeated calls to `set_solver_options(key,value)`.
* `clear_solver_options()` erases all solver options.
* `get_solver_options()` returns a dictionary of the options that
are currently set.

When a `JuMP` model is created using `Model(get_solver())` the
options are passed along.

Note that each call to `get_solver` clears all options.

#### Verbose output

The `set_solver_verbose()` function can be used to tell the solver to
be verbose in its operation. Alternatively, `set_solver_verbose(false)`
suppresses output.

The action of `set_solver_verbose` is through `set_solver_options`.

At present, this function only knows how to do this for the `Cbc`, `GLPK`, and
`Gurobi` optimizers.
