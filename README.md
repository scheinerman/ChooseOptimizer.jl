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
instead we do this:
```
MOD = Model(get_solver())
```

## Selecting and using solver options

Solver options can be set up using these functions:

* `set_solver_option(kwd, val)` adds the option whose name is
given by the symbol `kwd` to be the value `val`. To add several
options, use this several times.
* `clear_solver_options()` erases all solver options.
* `get_solver_options()` returns a dictionary of the options that
are currently set.

When a `JuMP` model is created using `Model(get_solver())` the
options are passed along.
