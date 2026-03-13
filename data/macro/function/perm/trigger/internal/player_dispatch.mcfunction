# ============================================
# macro:perm/trigger/internal/player_dispatch
# ============================================
# Iterates the bind list of the named trigger for a specific player (@s).
# Saves score, resets, re-enables; then tries binds.
#
# INPUT (makro): storage macro:engine _pt_tick_ctx = {name:"<trigger_adi>"}
# Call: AS @s (the player)
# ============================================

# Bu playernun trigger skorunu save
$scoreboard players operation $ptd_val macro.tmp = @s $(name)

# Reset and re-enable
$scoreboard players set @s $(name) 0
$scoreboard players enable @s $(name)

# Bind list emptysa stop
$execute unless data storage macro:engine perm_triggers.$(name)[0] run return 0

# Copy bind list to temporary (don't corrupt original)
$data modify storage macro:engine _ptd_binds set from storage macro:engine perm_triggers.$(name)

# Iterate
function macro:perm/trigger/internal/check_bind
data remove storage macro:engine _ptd_binds
data remove storage macro:engine _ptd_current
