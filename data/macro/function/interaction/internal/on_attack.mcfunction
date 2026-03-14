# ============================================
# macro:interaction/internal/on_attack
# ============================================
# Called AS the interaction entity.
#
# PATTERN:
#   1. Tag @s temporarily (macro.ia_active) — so we can
#      identify this exact entity from the player's context.
#   2. execute on attacker → player gets @s context.
#   3. From player context: iterate bind list,
#      check @e[tag=macro.ia_active, tag=$(tag)] exists.
#   4. Remove temp tag and clear attack NBT last.
#
# NOTE: data remove entity @s attack must happen AFTER
# execute on attacker — removing it first breaks the relation.
# ============================================

tag @s add macro.ia_active

data modify storage macro:engine _ia_iter set from storage macro:engine interaction_binds.attack
execute if data storage macro:engine _ia_iter[0] run execute on attacker run function macro:interaction/internal/dispatch

# Cleanup: remove temp tag and clear NBT (after execute on attacker)
tag @s remove macro.ia_active
data remove entity @s attack
data remove storage macro:engine _ia_iter
data remove storage macro:engine _ia_cur
