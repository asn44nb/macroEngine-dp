# ============================================
# macro:interaction/internal/on_use
# ============================================
# Called AS the interaction entity.
# Mirror of on_attack — uses execute on target
# and clears interaction NBT after.
# ============================================

tag @s add macro.ia_active

data modify storage macro:engine _ia_iter set from storage macro:engine interaction_binds.use
execute if data storage macro:engine _ia_iter[0] run execute on target run function macro:interaction/internal/dispatch

tag @s remove macro.ia_active
data remove entity @s interaction
data remove storage macro:engine _ia_iter
data remove storage macro:engine _ia_cur
