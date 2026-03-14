# ============================================
# macro:interaction/internal/dispatch
# ============================================
# Called AS the player (via execute on attacker/target).
# Iterates _ia_iter; for each entry checks whether
# the interaction entity (tagged macro.ia_active) also
# has the bind's tag. Fires func AS @s (player) if matched.
# ============================================

data modify storage macro:engine _ia_cur set from storage macro:engine _ia_iter[0]
data remove storage macro:engine _ia_iter[0]

function macro:interaction/internal/check_bind with storage macro:engine _ia_cur

execute if data storage macro:engine _ia_iter[0] run function macro:interaction/internal/dispatch
