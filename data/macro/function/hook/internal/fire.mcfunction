# macro:hook/internal/fire [MACRO]
# INPUT: $(event) — event name to fire
# @s = tetikleyen oyuncu
# Copies hook_binds list and dispatches it.

$data modify storage macro:engine _hook_fire_event set value "$(event)"
data modify storage macro:engine _hook_iter set from storage macro:engine hook_binds
function macro:hook/internal/dispatch

data remove storage macro:engine _hook_iter
data remove storage macro:engine _hook_fire_event
