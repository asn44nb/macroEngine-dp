# ============================================
# macro:interaction/internal/check_bind
# ============================================
# Called AS the player.
# INPUT (via with storage macro:engine _ia_cur):
#   tag  : bind tag to check
#   func : function to run if matched
#
# Finds the interaction entity that:
#   - has macro.ia_active (the one currently processing)
#   - has the bind's custom tag
# If found, runs func AS @s (player).
# ============================================

$execute if entity @e[type=minecraft:interaction,tag=macro.ia_active,tag=$(tag),limit=1] run function $(func)
