# ChooseOptimizer


This module is a tool to select different optimization engines.

Many of my modules rely on integer linear programming and use `JuMP`
and the like to solve the IPLs. This module makes switching between
different optimization engines easier.

## Selecting and using an optimizer

The `set_optimizer` function is used to select the optimization package
desired. Without any arguments it selects the `Cbc` optimizer. Otherwise,
`set_optimizer(NAME)` is used to choose the desired optimizer, e.g.,
`set_optimizer(Gurobi)`. (For this to work, this must follow
  `using Gurboi`.)

The function `get_optimizer` is a replacement for `JuMP`'s
`with_optimizer` function. Instead of this:
```
MOD = Model(with_optimizer(Cbc.Optimizer))
```
instead we do this:
```
MOD = Model(get_optimizer())
```

## Selecting and using optimizer options

Forthcoming!
